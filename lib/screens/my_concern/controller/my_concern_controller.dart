import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/my_concern/services/my_concern_api_services.dart';
import 'package:get/get.dart';
import '../../login_screen/model/user.dart';
import '../model/concern_category_model.dart';
import '../model/concern_list_model.dart';
import '../model/manager_concern_category_model.dart';
import '../model/manager_concern_model.dart';
import '../model/submit_concern.dart';
import '../model/submit_user_concern.dart';

class MyConcernController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final concernCategoryModel = ConcernCategoryModel().obs;
  final managerConcernCategoryModel = ManagerConcernCategoryModel().obs;
  final concernListModel = ConcernListModel().obs;
  final managerConcernModel = ManagerConcernModel().obs;
  final submitConcern = SubmitConcern().obs;
  final submitUserConcernModel = SubmitUserConcern().obs;
  var selectConcernId = 0.obs;
  final concernController = TextEditingController();
  late User user;

  var openConcerns = <Concerns>[].obs;
  var closedConcerns = <Concerns>[].obs;

  var openConcernsM = <ManagerConcerns>[].obs;
  var closedConcernsM = <ManagerConcerns>[].obs;

  @override
  void onInit() {
    user = LocalStorage.user();
    tabController = TabController(vsync: this, length: 2);
    getData();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getData();
  }

  Future<void> getData() async {
    if (user.roleId == 1) {
      getConcernCategoryList();
      getCustomerConcernList();
    } else {
      getConcernCategoryForManager();
      getConcernListForManager();
    }
  }

  Future<void> getConcernCategoryList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      concernCategoryModel.value =
          await MyConcernApiServices().getConcernCategoryList();
      selectConcernId.value = concernCategoryModel.value.data!.first.id;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getConcernCategoryForManager() async {
    isLoading(true);
    errorOccurred(false);
    try {
      managerConcernCategoryModel.value =
          await MyConcernApiServices().getConcernCategoryForManager();
      selectConcernId.value =
          managerConcernCategoryModel.value.managerConcernCategory!.first.id;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCustomerConcernList() async {

    isLoading(true);
    errorOccurred(false);

    try {
      concernListModel.value =
          await MyConcernApiServices().getCustomerConcernList();
      openConcerns.clear();
      closedConcerns.clear();

      for (var i = 0; i < concernListModel.value.data!.length; i++) {
        var data = concernListModel.value.data![i];
        // status : 0 = Closed
        // status : 1 = Open
        if (data.status == 1) {
          openConcerns.add(data);
        } else {
          closedConcerns.add(data);
        }
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getConcernListForManager() async {
    isLoading(true);
    errorOccurred(false);
    try {
      managerConcernModel.value =
          await MyConcernApiServices().getConcernListForManager();
      openConcernsM.clear();
      closedConcernsM.clear();

      for (var i = 0;
          i < managerConcernModel.value.managerConcernCategory!.length;
          i++) {
        var data = managerConcernModel.value.managerConcernCategory![i];
        // status : 0 = Closed
        // status : 1 = Open
        if (data.status == 1) {
          openConcernsM.add(data);
        } else {
          closedConcernsM.add(data);
        }
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitUserConcern() async {
    isLoading(true);
    errorOccurred(false);
    try {
      submitUserConcernModel.value = await MyConcernApiServices().submitUserConcern(
          selectConcernId.value, concernController.value.text);
      if (submitUserConcernModel.value.responseCode == 200) {
        concernController.clear();
        Get.back();
        showDialogForConfirmation(submitUserConcernModel.value.ticket);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      getCustomerConcernList();
    }
  }

  showDialogForConfirmation(ticket) async {
    Get.defaultDialog(
        title: 'Submitted',
        // titlePadding: EdgeInsets.zero,
        // contentPadding: EdgeInsets.zero,
        barrierDismissible: false,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              "Thanks for raising the concern, your ticket is $ticket.\nYour Concern will be shared with HR/App Admin and Leadership as the case may be."),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'))
        ]);
  }

  Future<void> submitManagerConcern() async {
    isLoading(true);
    errorOccurred(false);
    try {
      submitConcern.value = await MyConcernApiServices().submitManagerConcern(
          selectConcernId.value, concernController.value.text);
      if (submitConcern.value.responseCode == 200) {
        concernController.clear();
        Get.back();
        showDialogForConfirmation(submitConcern.value.data?.ticket);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      getConcernListForManager();
    }
  }
}

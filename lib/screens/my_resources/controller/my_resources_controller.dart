import 'package:flutter_state_management/screens/my_resources/model/learning_material_model.dart';
import 'package:flutter_state_management/screens/my_resources/model/other_link_list.dart';
import 'package:flutter_state_management/screens/my_resources/services/my_resource_service_api.dart';
import 'package:get/get.dart';
import '../model/company_site_data.dart';
import '../model/leadership_talk.dart';

class MyResourcesController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final learningMaterial =LearningMaterial().obs;
  final otherLinkModel =OtherLinkModel().obs;
  final companySiteData = CompanySiteData().obs;
  final leadershipTalk = LeadershipTalk().obs;
  String videoId = '';
  var url = '';

  @override
  void onInit() {
    getCompanySiteData();
    getLearningMaterial();
    getOtherLinkListData();
    getGetLeadershipTalkListData();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getCompanySiteData();
    getLearningMaterial();
    getOtherLinkListData();
    getGetLeadershipTalkListData();
  }

  Future<void> getCompanySiteData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      companySiteData.value = await MyResourceApiService().getCompanySiteListData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getGetLeadershipTalkListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      leadershipTalk.value = await MyResourceApiService().getGetLeadershipTalkListData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getOtherLinkListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      otherLinkModel.value = await MyResourceApiService().getOtherLinkListData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getLearningMaterial() async {
    isLoading(true);
    errorOccurred(false);
    try {
      learningMaterial.value = await MyResourceApiService().getLearningMaterial();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  String getVideoId(String url) {
    return isValidUrl(url) ? url.substring((url.length - 11), url.length) : "" ;
  }

  bool isValidUrl(String url) {
    if (url.isURL) {
      return true;
    } else {
      return false;
    }
  }
}

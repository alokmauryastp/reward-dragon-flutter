import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/screens/signup_screen/services/signup_api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObscure = true.obs;
  var isObscure2 = true.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController uniqueCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController dateOfJoiningController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  DateTime selectedDate = DateTime.now();
  RxString startDate = 'DD/MM/YYYY'.obs;

  RxInt userType = 0.obs;

  // RxInt teamId = 0.obs;
  // RxInt managerId = 0.obs;
  // RxString gender = 'Male'.obs;
  // RxString language = 'Male'.obs;
  // RxString dateOfJoining = ''.obs;
  // RxString location = ''.obs;

  var isLoading = false.obs;
  var errorOccurred = false.obs;

  @override
  void onInit() {
    getBaseLocation();
    getTeamListForSignup();
    super.onInit();
  }

  bool validation() {
    String pass = password.value.text;
    String cPass = confirmPassword.value.text;
    if (userType.value == 0) {
      Fluttertoast.showToast(msg: 'Select Role');
      return false;
    }
    if (pass.length < 6) {
      Fluttertoast.showToast(msg: 'Password should be at least 6 characters');
      return false;
    }
    if (pass != cPass) {
      Fluttertoast.showToast(msg: 'Both password should be same');
      return false;
    }
    return true;
  }

  Future<void> signUp() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await SignupApiService().signup(
        userType.value,
        firstName.value.text,
        lastName.value.text,
        uniqueCode.value.text,
        email.value.text,
        mobileNumber.value.text,
        password.value.text,
        confirmPassword.value.text,
        // gender.value,
        designationController.value.text,
        // language.value,
        // teamId.value,
        // managerId.value,
        // location.value,
        dateOfJoiningController.value.text,
      );
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamListForSignup() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await SignupApiService().getTeamListForSignup(uniqueCode.value.text);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getBaseLocation() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await SignupApiService().getBaseLocation(uniqueCode.value.text);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../services/forgot_password_api_service.dart';

class ForgotPasswordController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  TextEditingController otp = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formVerifyOtp = GlobalKey<FormState>();

  Future<void> onRefresh()async{
    verifyOtp();

  }

  Future<void> sendOtp() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await ForgotPasswordApiService().sendOtp(email.value.text, mobileNumber.value.text);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> verifyOtp() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await ForgotPasswordApiService().verifyOtp( email.value.text, mobileNumber.value.text, otp.value.text, newPassword.value.text,confirmPassword.value.text);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}

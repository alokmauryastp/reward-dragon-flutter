import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/forgot_password/controller/forgot_password_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetWidget<ForgotPasswordController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: SafeArea(
        child: Scaffold(appBar: AppBar(backgroundColor: blackApp,elevation: 0,),
          backgroundColor: blackApp,
          body: Obx(() => LoadingAndErrorScreen(
            isLoading: controller.isLoading.value,
            errorOccurred: controller.errorOccurred.value,
            errorResolvingFunction: controller.onRefresh,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:  15.w,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/login_logo.png',
                        height: 142.w,
                        width: 142.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF),
                            fontSize: 25.65.sp),
                      ),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color((0xffFFFFFF))),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          TextFormField(
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.6)),
                            controller: controller.email,
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffFFFFFF)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffFFC016)),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:
                                SvgPicture.asset('assets/images/email.svg'),
                              ),
                              labelText: "Enter Email",
                              labelStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                return "Enter Correct Email Address";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color((0xffFFFFFF))),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          TextFormField(
                            controller: controller.mobileNumber,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.6),
                            ),
                            cursorColor: const Color(0xffFFC016),
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.zero,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffFFFFFF)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffFFC016)),
                              ),
                              labelText: 'Enter Mobile',
                              labelStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgPicture.asset(
                                  'assets/images/mobile.svg',
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Mobile number can't be empty";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff414141),
                              Color(0xff000000),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.w),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 4, 0), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ],
                        ),
                        child: SizedBox(
                          height: 40.w,
                          width: 174.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                side: const BorderSide(
                                    width: 2, color: Color(0xffFFC016)),
                              ),
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.sendOtp();
                                }
                                // controller.email.clear();
                                // controller.mobileNumber.clear();
                                // Get.toNamed(ApplicationPages.verifyOtp);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: ((context) =>
                                //             const VerifyOtp())));
                              },
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}

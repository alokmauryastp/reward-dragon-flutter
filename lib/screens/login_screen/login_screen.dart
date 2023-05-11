import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/login_screen/controller/login_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/urls.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff252626),
          body: Obx(() => LoadingAndErrorScreen(
            errorResolvingFunction: controller.checkLogin,
                isLoading: controller.isLoading.value,
                errorOccurred: controller.errorOccurred.value,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/login_logo.png',
                            height: 130.w,
                            width: 130.w,
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                                fontSize: 25.65.sp),
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          height: 10.w,
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
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFFFFF)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xffFFC016)),
                                  ),
                                  prefixIcon: IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/images/email.svg',
                                    ), onPressed: () {  },
                                  ),
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.6),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ) {
                                    //!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
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
                                'Password',
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
                                controller: controller.passwordController,
                                obscureText: controller.isObscure.value,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFFFFF)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xffFFC016)),
                                  ),
                                  prefixIcon: IconButton(
                                    icon: SvgPicture.asset(
                                            'assets/images/password.svg',width:15.w,height: 15.w,), onPressed: () {  },
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isObscure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 24.w,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.3),
                                    ),
                                    onPressed: () {
                                      controller.isObscure.value =
                                          !controller.isObscure.value;
                                    },
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.6),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 12.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          ApplicationPages.forgotPassword);
                                    },
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(
                                          (0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                            blurRadius: 5)
                                        //blur radius of shadow
                                      ]),
                                  child: SizedBox(
                                    height: 40.w,
                                    width: 174.w,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          side: const BorderSide(
                                              width: 2,
                                              color: Color(0xffFFC016)),
                                        ),
                                        onPressed: () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            if (controller.checkValue.value) {
                                              controller.checkLogin();
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please check Terms of Service');
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Sign in',
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
                        SizedBox(
                          height: 30.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            InkWell(
                              onTap: (() {
                                Get.toNamed(ApplicationPages.signupScreen);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: ((context) => const SignupScreen()),
                                //     ));
                              }),
                              child: Text(
                                'Sign up >',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.w,
                        ),
                        Center(
                          child: Text(
                            "Made in india, with intelligence",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffFFC016),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 48.w,
                            ),
                            Checkbox(
                              value: controller.checkValue.value,
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: Color(0xffFFC016)),
                              ),
                              checkColor: const Color(0xffFFc016),
                              fillColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onChanged: (bool? value) {
                                controller.checkValue.value = value!;
                              },
                            ), //
                            Expanded(
                              child: InkWell(onTap: () async {
                                var url = Uri.parse(termConditionUrl);
                                if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                                } else {
                                throw "Could not launch $url";
                                }
                              },
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'I Agree with ',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms of service',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFFc016),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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

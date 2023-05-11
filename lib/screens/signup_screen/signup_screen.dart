import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/signup_screen/controller/signup_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Obx(() => Scaffold(
              backgroundColor: blackApp,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Form(
                    key: controller.formKey,
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
                        Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                                fontSize: 20.sp),
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              height: 14.w,
                              width: 14.w,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xffFFC016)),
                                toggleable: true,
                                value: 1,
                                groupValue: controller.userType.value,
                                onChanged: (int? value) {
                                  controller.userType.value = value!;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'User',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              height: 14.w,
                              width: 14.w,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xffFFC016)),
                                toggleable: true,
                                value: 2,
                                groupValue: controller.userType.value,
                                onChanged: (value) {
                                  controller.userType.value =
                                      int.parse(value.toString());
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Manager',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              height: 14.w,
                              width: 14.w,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xffFFC016)),
                                toggleable: true,
                                value: 3,
                                groupValue: controller.userType.value,
                                onChanged: (value) {
                                  controller.userType.value =
                                      int.parse(value.toString());
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Executive',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'First Name',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40.w,
                                width: 220.w,
                                child: TextFormField(
                                  controller: controller.firstName,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.6),
                                  ),
                                  cursorColor: const Color(0xffFFC016),
                                  decoration: InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffFFFFFF)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xffFFC016)),
                                    ),
                                    labelText: 'First name',
                                    labelStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Color(0xffFFC016),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "firstname can't be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.w,
                                width: 220.w,
                                child: TextFormField(
                                  controller: controller.lastName,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.6),
                                  ),
                                  cursorColor: const Color(0xffFFC016),
                                  decoration: InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffFFFFFF)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xffFFC016)),
                                    ),
                                    labelText: 'Last name',
                                    labelStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Color(0xffFFC016),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "lastname can't be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unique code',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              height: 60.w,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40.w,
                                      width: size.width * 90,
                                      child: TextFormField(
                                        controller: controller.uniqueCode,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: const Color(0xffFFC016),
                                        decoration: InputDecoration(
                                          // contentPadding: EdgeInsets.zero,
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xffFFC016)),
                                          ),
                                          labelText:
                                              'Unique code shared by your HR or Manager',
                                          labelStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SvgPicture.asset(
                                              'assets/images/unique_code.svg',
                                              // height: 10,
                                              // width: 10,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter the unique code";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'E-mail',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffFFFFFF),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' (Official email i’d)',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60.w,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 40.w,
                                          width: size.width * 90,
                                          child: TextFormField(
                                            controller: controller.email,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 0.6),
                                            ),
                                            cursorColor:
                                                const Color(0xffFFC016),
                                            decoration: InputDecoration(
                                              // contentPadding: EdgeInsets.zero,
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffFFFFFF)),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xffFFC016)),
                                              ),
                                              labelText: 'Enter Email',
                                              labelStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 0.6),
                                              ),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(14.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/email.svg',
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "email can't be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              height: 60.w,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50.w,
                                      width: size.width * 90,
                                      child: TextFormField(
                                        maxLength: 10,
                                        controller: controller.mobileNumber,
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: const Color(0xffFFC016),
                                        decoration: InputDecoration(
                                          // contentPadding: EdgeInsets.zero,
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xffFFC016)),
                                          ),
                                          labelText: 'Enter Mobile',
                                          labelStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(12.0),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Designation',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              height: 60.w,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50.w,
                                      width: size.width * 90,
                                      child: TextFormField(
                                        // maxLength: 10,
                                        controller:
                                            controller.designationController,
                                        // keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: const Color(0xffFFC016),
                                        decoration: InputDecoration(
                                          // contentPadding: EdgeInsets.zero,
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0xffFFC016)),
                                          ),
                                          labelText: 'Enter Designation',
                                          labelStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SvgPicture.asset(
                                              'assets/images/designation.svg',
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Designation can't be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Joining',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              height: 60.w,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50.w,
                                      width: size.width * 90,
                                      child: InkWell(
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        child: TextFormField(
                                          enabled: false,
                                          // maxLength: 10,
                                          controller: controller
                                              .dateOfJoiningController,
                                          // keyboardType: TextInputType.phone,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          cursorColor: const Color(0xffFFC016),
                                          decoration: InputDecoration(
                                            // contentPadding: EdgeInsets.zero,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffFFC016)),
                                            ),
                                            labelText: 'Date of Joining',
                                            labelStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 0.6),
                                            ),
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                'assets/images/designation.svg',
                                              ),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Date of joining can't be empty";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                            Text(
                              'Confirm password',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffFFFFFF)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50.w,
                                width: 220.w,
                                child: TextFormField(
                                  controller: controller.password,
                                  cursorColor: const Color(0xffFFC016),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.6)),
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
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/images/password.svg',
                                      ),
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
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50.w,
                                width: 220.w,
                                child: TextFormField(
                                  cursorColor: const Color(0xffFFC016),
                                  style: const TextStyle(
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.6)),
                                  controller: controller.confirmPassword,
                                  obscureText: controller.isObscure2.value,
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
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/images/password.svg',
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.isObscure2.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 24.w,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 0.3),
                                      ),
                                      onPressed: () {
                                        controller.isObscure2.value =
                                            !controller.isObscure2.value;
                                      },
                                    ),
                                    labelText: "Confirm Password",
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.w,
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
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    side: const BorderSide(
                                        width: 2, color: Color(0xffFFC016)),
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      if (controller.validation()) {
                                        controller.signUp();
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.6),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign in',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.back(),
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: const Color(0xffFFFFFF),
                                      decorationThickness: 2.0,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate) {
      // setState(() {
      controller.selectedDate = picked;
      controller.startDate.value = picked.toString().substring(0, 10);
      controller.dateOfJoiningController.text = controller.startDate.value;
      // });
    }
  }
}

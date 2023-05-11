import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/google_sign_in/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In'),
      ),
      body: RefreshIndicator(onRefresh: controller.onRefresh,
        child: Column(
          children: [
            MaterialButton(
              color: Colors.teal[100],
              elevation: 10,
              onPressed: () {controller.signIn2();},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Sign In with Google")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

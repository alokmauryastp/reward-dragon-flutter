import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  Future<void> onRefresh() async {
    getUser();
  }

  Future<void> getUser() async {
    // User? user = FirebaseAuth.instance.currentUser;
    signIn2();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signIn2() async {
    _googleSignIn.signIn().then((userData) async {
      userData?.authentication.then((googleKey) {
        LocalStorage.setString(keyAccessToken, googleKey.accessToken);
        LocalStorage.setString(keyIdToken, googleKey.idToken);
      });
    });
  }

  Future<void> getFitData() async {

  }

  Future<void> signIn() async {
// creating firebase instance
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      debugPrint(user?.displayName);
    }
  }
}

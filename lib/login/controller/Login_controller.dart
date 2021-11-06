import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_for_life/home/view/bottom_navigater.dart';
import 'package:time_for_life/login/controller/homecontroller.dart';
import 'package:time_for_life/login/view/customFullScreenDialog.dart';
import 'package:time_for_life/sign_up/view/sign_up_ui.dart';

class LoginController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Bạn phải nhập Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password phải trên 6 kí tự";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }

  void login() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await homeController.googleSign.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await homeController.firebaseAuth?.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    }
  }

  void login1() {
    Get.to(SignupUi());
  }

  void loginhome() {
    Get.to(Home());
  }
}

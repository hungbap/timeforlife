import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_for_life/contants/string_contants.dart';
import 'package:time_for_life/login/controller/homecontroller.dart';
import 'package:time_for_life/login/view/customFullScreenDialog.dart';
import 'package:time_for_life/login/view/login_ui.dart';
import 'package:time_for_life/utils/utils.dart';

class SignUpController extends GetxController{
  HomeController homeController = Get.put(HomeController());
  var tecUsername = TextEditingController().obs;
  var tecPassword = TextEditingController().obs;
  Rx<dynamic> errUsername = Rxn();
  Rx<dynamic> errPassword = Rxn();
  Rx<dynamic> username = Rxn();
  Rx<bool> showLoadingLogin = false.obs;
  Rx<dynamic> password = Rxn();
  late bool? isRegexPass = true;
  late bool? isRegexUser = true;
  validateUsername() {
    username.value = tecUsername.value.text.toString().trim();

    if (username.value.toString().trim().length == 0) {
      errUsername.value =StringContanst.errNullUsername;
    } else {
      errUsername.value = null;
    }
  }

  validatePassword() {
    password.value = tecPassword.value.text.toString().trim();

    if (password.value.toString().trim().length == 0) {
      errPassword.value = StringContanst.errSortPassword;
    }else {
      errPassword.value = null;
    }
  }
  validate() {
    username.value = tecUsername.value.text.toString().trim();
    password.value = tecPassword.value.text.toString().trim();
    if (password.value.length == 0) {
      errPassword.value = StringContanst.errSortPassword;
    } else if (!isRegexPass!) {
      errPassword.value = StringContanst.errSortPassword;
    } else if (!isRegexUser!) {
      errUsername.value = StringContanst.noSpecialValue;
    } else if (username.value.length == 0) {
      errUsername.value = StringContanst.errNullUsername;
    } else {
      errUsername.value = null;
      errPassword.value = null;
      Utils.hideKeyboard(Get.context);
    }
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
  void signUp1 (){
    Get.to(LoginUi());
  }
}
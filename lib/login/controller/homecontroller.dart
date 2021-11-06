import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_for_life/home/view/bottom_navigater.dart';
import 'package:time_for_life/home/view/home_ui.dart';
import 'package:time_for_life/login/view/login_ui.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth? firebaseAuth;

  @override
  void onInit() {
    super.onInit();
     firebaseAuth = FirebaseAuth.instance;
  }

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth?.currentUser != null;
    firebaseAuth?.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.to(Home());
    } else {
      Get.to(LoginUi());
    }
}
}

import 'package:get/get.dart';
import 'package:time_for_life/introduce/view/introduce_ui.dart';
import 'package:time_for_life/login/controller/homecontroller.dart';

class SettingController extends GetxController{
  HomeController homeController = Get.find<HomeController>();
  void logout() async {
    await homeController.googleSign.disconnect();
    await homeController.firebaseAuth!.signOut();
  }
  void setting(){
    Get.to(IntroduceUi());
  }
}
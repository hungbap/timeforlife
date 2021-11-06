import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:time_for_life/contants/string_contants.dart';
import 'package:time_for_life/login/controller/Login_controller.dart';
import 'package:time_for_life/utils/utils.dart';
import 'package:get/get.dart';

class LoginUi extends GetWidget<LoginController> {
final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(
                    'assets/image/logo.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  StringContanst.timefor,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Utils.form(

                      hinttext: 'Tên tài khoản', labeltext: 'Tên tài khoản'),


                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child:
                          Utils.form(
                              hinttext: 'Mật khẩu', labeltext: 'Mật khẩu'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    controller.loginhome();
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color(0xff132A9F),
                    ),
                    child: const Center(
                        child: Text(
                      "đăng nhập",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "chưa có tài khoản?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        controller.login1();
                      },
                      child: const Text(
                        'Đăng kí ngay',
                        style: TextStyle(
                            color: Color(0xff132A9F), fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Hoặc đăng nhập qua'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        child: SvgPicture.asset(
                          'assets/image/gg.svg',
                          allowDrawingOutsideViewBox: true,
                        ),
                        onTap: () {
                          controller.login();
                        }
                    ),
                    const SizedBox(width: 25,),
                    SvgPicture.asset(
                      'assets/image/facebook.svg',
                      allowDrawingOutsideViewBox: true,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

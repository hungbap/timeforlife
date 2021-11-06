import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:time_for_life/contants/image.dart';
import 'package:time_for_life/setting/controller/setting_controller.dart';

class SettingUi extends GetWidget<SettingController> {
  SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 695),
        builder: () => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff132A9F),
                ),
                Container(
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(AppImages.background),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, left: 10),
                            child: Text(
                              "Cài đặt",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: SvgPicture.asset(
                                'assets/image/logo.svg',
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "ngô văn hưng",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 550.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 60.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(image: AssetImage(AppImages.gear)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('chon màu thêm'),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 60.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(image: AssetImage(AppImages.color)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Màu sắc cấp độ'),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(image: AssetImage(AppImages.clock)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Thời gian lập công việc'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('09:00'),
                                        Text('->'),
                                        Text('10:00'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(
                                          image: AssetImage(AppImages.alClock)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Thời gian kiểm tra lại công việc'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text('09:00'),
                                        Text('->'),
                                        Text('10:00'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(image: AssetImage(AppImages.musi)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Âm thanh thông báo '),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Text("Mặc định(囍 - 葛东琪)"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 80.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image(image: AssetImage(AppImages.tran)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Ngôn ngữ '),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Text("Tiếng việt"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              controller.setting();
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 60.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(image: AssetImage(AppImages.info)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Giới thiệu'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.logout();
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 60.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image(image: AssetImage(AppImages.out)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Đăng xuất'),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                      ),
                                    )
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
              ],
            ));
  }
}

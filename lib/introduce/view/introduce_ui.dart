import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:time_for_life/contants/image.dart';
class IntroduceUi extends StatelessWidget {
  const IntroduceUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenUtilInit(
          designSize: Size(428, 695),
          builder: ()=>  Stack(
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
                   
                      child: SafeArea(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: SvgPicture.asset(
                                    'assets/image/back.svg',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                              ),
                            SizedBox(width: 10,),
                            const Text(
                              "Giới thiệu ",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
              Container(
                height: 600.h,
                width: double.infinity,
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15) ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                          Stack(
                            children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 10, right: 10),
                                   child: Container(
                                    height: 270.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        border: Border.all(color: Colors.blueAccent)
                                    ),
                                     child: Column(
                                       children: [
                                         SizedBox(height: 50,),
                                             Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                         SizedBox(height: 20,),
                                         Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                         SizedBox(height: 20,),
                                         Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                       ],
                                     ),
                              ),

                               ),
                              Positioned(
                                  bottom: 290.sp,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Card(
                                      elevation: 3,
                                      child: Container(
                                        height: 40.h,
                                      width: 120.w,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(15)),
                                         ),
                                         child : Center(child: Text('TIME FOR LINE', style: TextStyle(fontWeight: FontWeight.bold),)),
                                      ),


                                    ),
                                  ),
                                ),
                          
                            ],

                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 270.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      border: Border.all(color: Colors.blueAccent)
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50,),
                                      Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                      SizedBox(height: 20,),
                                      Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                      SizedBox(height: 20,),
                                      Text("Time for line là ứng dụng hỗ trợ quản lý công việc cá nhân\n theophương pháp ma trận Eise hay còn gọi Eise box. Phương \npháp này chi công việc của bạn thành 4 mức độ khác nhau "),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 290.sp,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      height: 40.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      child : Center(child: Text('VỀ CHÚNG TÔI', style: TextStyle(fontWeight: FontWeight.bold),)),
                                    ),


                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Image(image: AssetImage(AppImages.SAO)),
                        ),
                        Text('Gửi đánh giá'),
                        SizedBox(height: 40,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );

  }

}
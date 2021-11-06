import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:time_for_life/contants/image.dart';
import 'package:time_for_life/home/controller/detail-controller.dart';
import 'package:time_for_life/home/controller/home_controller.dart';
class HomeUi extends GetWidget<HomeViewController> {
  HomeViewController _homeViewController = Get.put(HomeViewController());
  DetailController _detailController = Get.put(DetailController());
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
                  //     image: AssetImage(AppImages.background),
                  //     fit: BoxFit.cover,
                  //
                  // ),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      child: SvgPicture.asset(
                                        'assets/image/logo.svg',
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("ngô văn hưng", style: TextStyle(fontSize: 20, color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 120),
                            InkWell(
                              onTap: (){
                                controller.home1();
                              },
                              child: SvgPicture.asset(
                                'assets/image/add.svg',
                              ),
                            ),
                          ],
                        ),
                    ),
                    SizedBox(height: 5,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child:  Text("Tháng9,2021", style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),),
                    ),
                    SizedBox(height: 5,),
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor:Colors.white70,
                      selectedTextColor: Color(0xff132A9F),
                    ),
                  ],
                ),
              ),

              Container(
                height: 500.h,
                width: double.infinity,
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15) ),
                ),
                  child: InkWell(
                    onTap: (){
                      controller.detaihome();
                    },
                    child: Obx(()=>ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, i){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                              child:Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          const CircleAvatar(
                                              radius: 10,
                                              child: Image(
                                                  image: AssetImage(AppImages.check)),
                                          ),
                                          Container(
                                            height: 60.h,
                                            width: 1.w,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 80.h,
                                    width: 350.w,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFBD7FC),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("${controller.list[i].timestart} - ",style: TextStyle(color:Colors.black ),),
                                                  Text("${controller.list[i].time1}",style: TextStyle(color:Colors.black ),)
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                          backgroundColor: Colors.grey,
                                                          radius: 10,
                                                          child: SvgPicture.asset(
                                                            AppImages.al1,
                                                            color: Colors.white,
                                                          )
                                                      ),
                                                      SizedBox(width: 4,),
                                                      CircleAvatar(
                                                          backgroundColor: Colors.grey,
                                                          radius: 10,
                                                          child: SvgPicture.asset(
                                                            AppImages.noti,
                                                            color: Colors.white,
                                                          )
                                                      ),
                                                      SizedBox(width: 4,),
                                                      CircleAvatar(
                                                          backgroundColor: Colors.grey,
                                                          radius: 10,
                                                          child: SvgPicture.asset(
                                                            AppImages.kpi1,
                                                            color: Colors.white,
                                                          )
                                                      ),
                                                    ],
                                                  ),

                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text('${controller.list[i].congviec}',style: TextStyle(color:Colors.black , fontSize: 15),),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        );

                      },
                    ),),
                  )
                ),

            ],
          )
      ),
    );

  }

}

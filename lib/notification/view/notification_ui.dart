import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:time_for_life/contants/image.dart';
import 'package:time_for_life/home/controller/home_controller.dart';
class NotificationUI extends GetWidget<HomeViewController> {
  HomeViewController _homeViewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
               child: const Padding(
                 padding: EdgeInsets.only(top: 40, left: 10),
                 child: Text("Thông báo", style: TextStyle(fontSize: 20, color: Colors.white),),
               ),
            ),
            Container(
                height: 600.h,
                width: double.infinity,
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15) ),
                ),
                child: Obx(()=>ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, i){
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Card(
                       elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 80.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Công việc sắp hết hạn', style: TextStyle(fontSize: 18),),
                                SizedBox(height: 5,),
                                Text('${controller.list[i].congviec}',style: TextStyle(color:Colors.black38 ),),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text('${controller.list[i].time1}'),
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                    );

                  },
                ),)
            ),

          ],
        )
    );

  }

}
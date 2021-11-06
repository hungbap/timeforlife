import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:time_for_life/contants/image.dart';
import 'package:time_for_life/home/controller/home_controller.dart';
import 'package:time_for_life/utils/utils.dart';
import 'package:get/get.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

import 'bottom_navigater.dart';
import 'home_ui.dart';

class AddUI extends GetWidget<HomeViewController> {
  final HomeViewController _homeViewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {


    return Material(
      child: ScreenUtilInit(
          designSize: const Size(428, 695),
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
                                      InkWell(
                                        child: SvgPicture.asset(
                                          'assets/image/back.svg',
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Thêm mới ",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => DropdownButton<String>(
                                isDense: true,
                                style: const TextStyle(color: Colors.white),
                                dropdownColor: Colors.black38,
                                iconEnabledColor: Colors.white,
                                onChanged: (value) {
                                },
                                value: controller.dropdownvalue1.value ==
                                    ''
                                    ? null
                                    : controller.dropdownvalue1.value,
                                elevation: 10,
                                items: controller.items1.map((value) {
                                  return DropdownMenuItem<String>(
                                    onTap: () => controller
                                        .onSelected1(value),
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                              )
                              ),
                              const Padding(
                                padding:  EdgeInsets.only(right: 10),
                                child:  Text("Tháng9,2021", style:  TextStyle( color: Colors.white, fontSize: 17),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.white70,
                          selectedTextColor: Color(0xff132A9F),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'Nhiệm vụ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                controller: controller.textcongviec,
                                maxLines: 5,
                                onChanged: (value){
                                  controller.onChane();
                                },
                                decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xffD7ECFC),
                                  border: InputBorder.none,
                                  labelText: 'Nội dung công việc...',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 30, right: 70),
                                      child: Text(
                                        'Bắt đầu',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Card(
                                        elevation: 3,
                                        child: Container(
                                          height: 40.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.6),
                                              ),
                                            ],
                                          ),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                showPicker(
                                                  context: context,
                                                  value: _homeViewController.time1.value,
                                                  onChange: _homeViewController.onTimeChanged1,
                                                  minuteInterval: MinuteInterval.FIVE,
                                                  disableHour: false,
                                                  disableMinute: false,
                                                  minMinute: 7,
                                                  maxMinute: 56,
                                                  onChangeDateTime: (DateTime dateTime) {
                                                    print(dateTime);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Obx(()=>Text(
                                                  _homeViewController.time1.value.format(context),
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),),
                                                const Image(
                                                  image: AssetImage(AppImages.hour),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 80, top: 30),
                                      child: Text(
                                        'Kết thúc',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10, right: 10),
                                      child: Card(
                                        elevation: 3,
                                        child: Container(
                                          height: 40.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.6),
                                              ),
                                            ],
                                          ),
                                          child: FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                showPicker(
                                                  context: context,
                                                  value: _homeViewController.time.value,
                                                  onChange: _homeViewController.onTimeChanged,
                                                  minuteInterval: MinuteInterval.FIVE,
                                                  disableHour: false,
                                                  disableMinute: false,
                                                  minMinute: 7,
                                                  maxMinute: 56,
                                                  // Optional onChange to receive value as DateTime
                                                  onChangeDateTime: (DateTime dateTime) {
                                                    print(dateTime);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                               Obx(()=>Text(
                                                 _homeViewController.time.value.format(context),
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),),
                                                Image(
                                                  image: AssetImage(AppImages.hour),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 30),
                                child: Text(
                                  'Mức độ ưu tiên ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                     controller.setcolo1('quan trong');
                                    },
                                    child: Obx(
                                            () => Utils.contai(
                                              text: "quan trọng",
                                                color: controller.click1.value
                                                ? Colors.white70
                                                    :Color(0xffFBD7FC),
                                            )

                                    )),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  Expanded(
                                    child: InkWell(
                                        onTap: (){
                                          controller.setcolo2('Khẩn cấp');
                                        },
                                        child: Obx(
                                                () => Utils.contai(
                                              text: "Khẩn cấp",
                                              color: controller.click2.value
                                                  ? Colors.white70
                                                  :Color(0xffFCD7E2),
                                            )

                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        onTap: (){
                                          controller.setcolo3('không quan trong');
                                        },
                                        child: Obx(
                                                () => Utils.contai(
                                              text: "không quan trong",
                                              color: controller.click3.value
                                                  ? Colors.white70
                                                  :Color(0xffD7ECFC),
                                            )

                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  
                                  Expanded(
                                    child: InkWell(
                                        onTap: (){
                                          controller.setcolo4('Không Khẩn cấp');
                                        },
                                        child: Obx(
                                                () => Utils.contai(
                                              text: "Không Khẩn cấp",
                                              color: controller.click4.value
                                                  ? Colors.white70
                                                  :Color(0xffD9D7FC),
                                            )

                                        )),
                                  ),
                                  const SizedBox(width: 10,),
                                ],
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 30),
                                child: Text(
                                  'Nhắc nhở ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                                       child: Container(
                                        height: 150.h,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF4F4FF),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 20),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Image(
                                                    image: AssetImage(AppImages.alarm),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Obx(() => DropdownButton<String>(
                                                    isDense: true,
                                                    style: const TextStyle(color: Colors.white),
                                                    dropdownColor: Colors.white,
                                                    iconEnabledColor: Colors.black,
                                                    onChanged: (value) {
                                                    },
                                                    value: controller.dropdownvalue.value ==
                                                        ''
                                                        ? null
                                                        : controller.dropdownvalue.value,
                                                    elevation: 10,
                                                    items: controller.items.map((value) {
                                                      return DropdownMenuItem<String>(
                                                        onTap: () => controller
                                                            .onSelected(value),
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: const TextStyle(
                                                              color: Colors.black),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  )
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: (){
                                                            controller.setnn1('Alarm');
                                                          },
                                                          child: Obx(
                                                                  () =>  CircleAvatar(
                                                                    backgroundColor: controller.nnal.value
                                                                  ? Colors.grey
                                                                      :Color(0xff508EF8 ),
                                                                    radius: 10,
                                                                    child: SvgPicture.asset(
                                                                      AppImages.al1,
                                                                color: Colors.white,
                                                              )
                                                                  ),
                                                          )),
                                                      SizedBox(width: 10,),
                                                      Text("Alarm")
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 60),
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: (){
                                                              controller.setnn2('Notification');
                                                            },
                                                            child: Obx(
                                                                  () =>  CircleAvatar(
                                                                  backgroundColor: controller.nnnoti.value
                                                                      ? Colors.grey
                                                                      :Color(0xffFCBA04 ),
                                                                  radius: 10,
                                                                  child: SvgPicture.asset(
                                                                    AppImages.noti,
                                                                    color: Colors.white,
                                                                  )
                                                              ),
                                                            )),
                                                        SizedBox(width: 10,),
                                                        Text("Notification")
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                children: [
                                                  InkWell(
                                                      onTap: (){
                                                        controller.setnn3('Đánh giá KPI');
                                                      },
                                                      child: Obx(
                                                            () =>  CircleAvatar(
                                                            backgroundColor: controller.nnkpi.value
                                                                ? Colors.grey
                                                                :Color(0xffEC0312 ),
                                                            radius: 10,
                                                            child: SvgPicture.asset(
                                                              AppImages.kpi1,
                                                              color: Colors.white,
                                                            )
                                                        ),
                                                      )),
                                                  const SizedBox(width: 10),
                                                  const Text("Đánh giá KPI")
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                  ),


                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10,top: 50,bottom: 40),
                              child: InkWell(
                               onTap: (){
                                   controller.insetData();
                                   controller.onInit();
                                   Get.to(()=>Home());
                               },
                                child: Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    color: Color(0xff132A9F),
                                  ),
                                  child: const Center(
                                      child: Text(
                                        "Lưu",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}

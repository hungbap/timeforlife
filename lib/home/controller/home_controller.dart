import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_for_life/home/view/add_ui.dart';
import 'package:time_for_life/home/view/detail_home.dart';
import 'package:time_for_life/login/controller/homecontroller.dart';

import 'model.dart';
class HomeViewController extends GetxController{
  HomeController homeController = Get.find<HomeController>();
     User? user;
  var dropdownvalue = 'Trước 5 phút'.obs;
  var items = ['Trước 5 phút','Trước 10 phút', 'Trước 15 phút', 'không cần đến'];
  var dropdownvalue1 = 'Theo ngày'.obs;
  var items1 = ['Theo ngày','Theo tháng'];
  var click1 = false.obs;
  var click2 = false.obs;
  var click3 = false.obs;
  var click4 = false.obs;
  var qt = '';
  var kc = '';
  var kqt = '';
  var kkc = '';
  var timedate =''.obs;
  var nnal = false.obs;
  var nnnoti= false.obs;
  var nnkpi = false.obs;
  RxList<Work> list = RxList<Work>();
  var  textcongviec = TextEditingController();

  dynamic noidungcongviec = ''.obs;
  final databaseRef= FirebaseDatabase.instance.reference();
  void insetData() async{
   await databaseRef.child("work").push().set({
     'congviec': noidungcongviec.value,
     'timestart': '${time1.value.hour}:${time1.value.minute}',
     'time1': '${time.value.hour}:${time.value.minute}',
     'quantrong': click1.value,
     'khancap': click2.value,
     'khongquantrong': click3.value,
     'khongkhancap': click4.value,
     'han':"${dropdownvalue.value}",
     'nnalarm':nnal.value,
     'noti':nnnoti.value,
     'kpi': nnkpi.value,
     'qt': qt,
     'kc': kc,
     'kqt': kqt,
     'kkc': kkc,
   }).catchError((onError){
   print('error${onError}');
   });
  }
  void getdata() async{
    await FirebaseDatabase.instance.reference().child("work").once().then((DataSnapshot dataSnapshot){
      var data=dataSnapshot.value!;
      var keys=dataSnapshot.value!.keys;
      print('ker$keys');
      print("data1$data");
      // var total = [];
      // data.forEach((v) => total.add(v));
      // print('length fail ${total.length}');
      list.clear();
      for(var key in keys){
        Work work= Work(
          congviec: data [key]["congviec"],
           han: data [key] ['han'],
         kc: data [key] ['kc'],
          khancap: data [key] ['khancap'],
           khongkhancap: data [key] ['khongkhancap'],
          khongquantrong: data [key] ['khongquantrong'],
          kkc: data [key] ['kkc'],
          kpi: data [key] ['kpi'],
        nnalarm: data [key] ['nnalarm'],
          kqt: data [key] ['kqt'],
          noti: data [key] ['noti'],
          qt: data [key] ['qt'],
          quantrong: data [key] ['quantrong'],
          time1: data [key] ['time1'],
          timestart: data [key] ['timestart'],
        );
        print('work${work.congviec}');
        list.add(work);

      }
      textcongviec.text='';
    });
  }
  Rx<TimeOfDay> time = TimeOfDay.now().replacing(minute: 30).obs ;
  void onTimeChanged(TimeOfDay newTime) {
    time.value = newTime;
  }
  void onChane(){
    noidungcongviec.value =  textcongviec.value.text.toString().trim() ;
    print(noidungcongviec.value);
  }
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
    getdata();
  }
  void detaihome(){
    Get.to(DetailHome());
  }
  Rx<TimeOfDay> time1 = TimeOfDay.now().replacing(minute: 30).obs ;
  void onTimeChanged1(TimeOfDay newTime) {
    time1.value = newTime;
  }
  void home1 (){
    Get.to(AddUI());
  }
  void onSelected(String value) {
    print(value);
    dropdownvalue.value = value;
    update();
  }
  void onSelected1(String value) {
    print(value);
    dropdownvalue1.value = value;
    update();
  }
  void setcolo1 (String value){
    click1.value=!click1.value;
    if(click1.value == true){
      qt = 'quan trong';
      print('$qt');
    }else{
      qt ="";
    }
  }
  void setcolo2 (String value){
    click2.value=!click2.value;
    if(click2.value == false){
      kc = 'khẩn cấp ';
      print('$kc');
    }else{
      kc ="";
    }
  }
  void setcolo3 (String value){
    click3.value=!click3.value;
    if(click3.value == false){
      kqt = 'không quan trong';
      print('$kqt');
    }else{
      kqt ="";
    }
  }
  void setcolo4 (String value){
    click4.value=!click4.value;
    if(click4.value == false){
      kkc = 'không khẩn cấp';
      print('$kkc');
    }else{
      kkc ="";
    }
  }
  void setnn1 (String value){
    nnal.value=!nnal.value;
  }
  void setnn2 (String value){
    nnnoti.value=!nnnoti.value;
  }
  void setnn3 (String value){
    nnkpi.value=!nnkpi.value;
  }
}
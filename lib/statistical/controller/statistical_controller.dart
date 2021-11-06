import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class StatisticalController extends GetxController{

  Rx<DateTime> currentDate = DateTime.now().obs;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate.value,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
        currentDate.value = pickedDate ;

  }
  Rx<DateTime> currentDatethang = DateTime.now().obs;
  Future<void> selectDate1(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDatethang.value,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDatethang)
      currentDatethang.value = pickedDate ;

  }
  Rx<DateTime> currentDatenam = DateTime.now().obs;
  Future<void> selectDate2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDatenam.value,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDatenam)
      currentDatenam.value = pickedDate ;

  }
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  final List<ChartData> chartData = [
    ChartData('không quan trong, khẩn cấp ', 25, Color(0xffD7ECFC)),
    ChartData('không quan trong, không khẩn cấp ', 38, Color(0xffD9D7FC)),
    ChartData('quan trong, không khẩn cấp ', 34, Color(0xffFBD7FC)),
    ChartData('quan trong,  khẩn cấp ', 52, Color(0xffFCD7E2)),
    ChartData('tạo công việc đúng hạn', 52, Color(0xffD6D5D5)),
  ];
  final List<SalesData> chartData1 = [
    SalesData("tuần 1", 35),
    SalesData("tuần 2", 28),
    SalesData("tuần 3", 34),
    SalesData("tuần 4", 32),
    SalesData("tuần 5", 40)
  ];
  final List<SalesData> chartData2 = [
    SalesData("t1", 15),
    SalesData("t2", 28),
    SalesData("t3", 34),
    SalesData("t4", 42),
    SalesData("t5", 10),
    SalesData("t6", 34),
    SalesData("t7", 12),
    SalesData("t8", 22),
    SalesData("t9", 52),
    SalesData("t10", 15),
    SalesData("t11", 32),
    SalesData("t12", 32),
  ];

}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}


class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}


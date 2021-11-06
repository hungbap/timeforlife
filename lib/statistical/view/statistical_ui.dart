import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:time_for_life/contants/image.dart';
import 'package:time_for_life/statistical/controller/statistical_controller.dart';
import 'package:time_for_life/utils/utils.dart';
class StatisticalUi extends GetWidget<StatisticalController> {
  final StatisticalController _statisticalController =
      Get.put(StatisticalController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: ScreenUtilInit(
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
                    //
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
                              "Thống kê",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                      const SizedBox(height: 10),
                      ButtonsTabBar(
                           height: 50.h,
                          backgroundColor: Colors.white,
                          unselectedBackgroundColor: Colors.white30,
                          unselectedLabelStyle: TextStyle(color: Colors.white),
                          labelStyle:
                          TextStyle(color: Color(0xff132A9F), fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(
                              child:Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Center(child: Text('Ngày'))
                              )
                            ),
                            Tab(
                                child:Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(child: Text('Tháng'))
                                )
                            ),
                            Tab(
                                child:Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(child: Text('Năm'))
                                )
                            ),

                          ],
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
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            height: 40.h,
                                            width: 180.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10)),
                                              color: Colors.white70,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                ),
                                              ],
                                            ),
                                            child: FlatButton(
                                              onPressed: () => _statisticalController
                                                  .selectDate(context),
                                              child: Obx(() => Text(_statisticalController
                                                  .currentDate.value
                                                  .toString())),
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Image(
                                        image: AssetImage(AppImages.button),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    child: SfCircularChart(
                                        series: <CircularSeries>[
                                          // Renders doughnut chart
                                          DoughnutSeries<ChartData, String>(
                                              dataSource: _statisticalController.chartData,
                                              pointColorMapper: (ChartData data, _) =>
                                              data.color,
                                              xValueMapper: (ChartData data, _) => data.x,
                                              yValueMapper: (ChartData data, _) => data.y)
                                        ]
                                    )
                                ),
                                Text("Tổng điểm KPI : 4/6", style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 150.h,
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
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10, top:10),
                                            child: Text('Đang thực hiện: 2/6', style: TextStyle(color: Color(0xff0B05C7), fontSize:  17),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15, right: 15),
                                            child: Divider(color: Colors.grey,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 200.h,
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
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10, top:10),
                                            child: Text('hoàn thành : 4/6', style: TextStyle(color: Color(0xff0B05C7), fontSize:  17),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 15, right: 15),
                                            child: Divider(color: Colors.grey,),
                                          ),
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
                      Center(
                        child: SingleChildScrollView(
                          child: SafeArea(
                              child:Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          height: 40.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                            color: Colors.white70,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.2),
                                              ),
                                            ],
                                          ),
                                          child: FlatButton(
                                            onPressed: () => _statisticalController
                                                .selectDate1(context),
                                            child: Obx(() => Text(_statisticalController
                                                .currentDatethang.value
                                                .toString())),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      series: <ChartSeries>[
                                        SplineSeries<SalesData, String>(
                                            dataSource: _statisticalController.chartData1,
                                            // Type of spline
                                            splineType: SplineType.cardinal,
                                            cardinalSplineTension: 0.9,
                                            xValueMapper: (SalesData sales, _) => sales.year,
                                            yValueMapper: (SalesData sales, _) => sales.sales
                                        )
                                      ]
                                  )
                              ),
                              Utils.uista(text: 'Tuần 1'),
                              SizedBox(height: 20,),
                              Utils.uista(text: 'Tuần 2'),
                              SizedBox(height: 20,),
                              Utils.uista(text: 'Tuần 3'),
                              SizedBox(height: 20,),
                              Utils.uista(text: 'Tuần 4'),
                              SizedBox(height: 20,),
                              Utils.uista(text: 'Tuần 5'),
                            ],
                          ) ),
                        ),
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: SafeArea(
                              child:Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10, left: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Card(
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              height: 40.h,
                                              width: 180.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(10)),
                                                color: Colors.white70,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                  ),
                                                ],
                                              ),
                                              child: FlatButton(
                                                onPressed: () => _statisticalController
                                                    .selectDate2(context),
                                                child: Obx(() => Text(_statisticalController
                                                    .currentDatenam.value
                                                    .toString())),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      child: SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          series: <ChartSeries>[
                                            SplineSeries<SalesData, String>(
                                                dataSource: _statisticalController.chartData2,
                                                // Type of spline
                                                splineType: SplineType.cardinal,
                                                cardinalSplineTension: 0.9,
                                                xValueMapper: (SalesData sales, _) => sales.year,
                                                yValueMapper: (SalesData sales, _) => sales.sales
                                            )
                                          ]
                                      )
                                  ),
                                   Utils.uista(text: 'Tháng 1'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 2'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 3'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 4'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 5'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 6'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 7'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 8'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 9'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 10'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 11'),
                                  SizedBox(height: 20,),
                                  Utils.uista(text: 'Tháng 12'),
                                ],
                              ) ),
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            )),
      ),
      

    );
  }
}


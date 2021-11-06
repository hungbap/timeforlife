import 'package:flutter/material.dart';
import 'package:time_for_life/home/view/home_ui.dart';
import 'package:time_for_life/notification/view/notification_ui.dart';
import 'package:time_for_life/setting/view/setting_ui.dart';
import 'package:time_for_life/statistical/view/statistical_ui.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex=0;
  List _screens=[HomeUi(),StatisticalUi(),NotificationUI(),SettingUi()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Color(0xff132A9F),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            label: "Công việc",
            icon: ImageIcon( AssetImage("assets/icon/project.png"),),
          ),
          BottomNavigationBarItem(
            label: "thống kê",
            icon: ImageIcon( AssetImage("assets/icon/chart.png"),),
          ),
          BottomNavigationBarItem(
            label: "Thông báo ",
            icon: ImageIcon( AssetImage("assets/icon/notification.png"),),
          ),
          BottomNavigationBarItem(
            label: "cài đặt",
            icon: ImageIcon( AssetImage("assets/icon/user.png"),),
          ),
        ],
      ),
    );
  }


}

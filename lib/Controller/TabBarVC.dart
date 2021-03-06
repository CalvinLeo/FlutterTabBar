import 'package:flutter/material.dart';
import 'HomeVC.dart';
import 'FindVC.dart';
import 'MeVC.dart';
import 'package:dbcDemo/Common/AppIcons.dart';

class TabBarVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarState();
  }
}

class TabBarState extends State<TabBarVC> {
  
  var _tabBarIdx = 0;
  var _appBarTitles;
  var _pageList;

  @override
  Widget build(BuildContext context) {
    initData();
    
    return Scaffold(
      body: _pageList[_tabBarIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: AppIcons.home, title: getTabTitle(0)),
          BottomNavigationBarItem(icon: AppIcons.find, title: getTabTitle(1)),
          BottomNavigationBarItem(icon: AppIcons.me, title: getTabTitle(2)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabBarIdx,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            _tabBarIdx = index;
          });
        },
      ),
    );
  }

  // 初始化数据
  void initData() {
    _appBarTitles = ["首页", "发现", "我的"];
    _pageList = [HomeVC(), FindVC(), MeVC()];
  }

  // 获取标题
  Text getTabTitle(int currentIdx) {
    if (currentIdx == _appBarTitles) {
      return Text(_appBarTitles[currentIdx],
        style: TextStyle(fontSize: 14.0, color: const Color(0xff1296db)),
      );
    }
    else {
      return Text(_appBarTitles[currentIdx],
        style: TextStyle(fontSize: 14.0, color: const Color(0xff515151)),
      );
    }
  }
}
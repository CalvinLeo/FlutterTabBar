import 'package:dbcDemo/Common/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:dbcDemo/Common/HttpClient.dart';

class HomeVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomeVC> {

  var homeTitle;

  @override
  void initState() {
    loadData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Im, my content $homeTitle',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color:AppColors.black_333),
        ),
      ),
    );   
  }

  // 加载请求
  loadData() async {
    Map<String, dynamic> params = {
      "os": "ios",
    };
    HttpClient httpclient = HttpClient.instance;
    await httpclient.get("http://baidu.com", 
      params: params,
      successCallBack: (int code, String msg, dynamic data) {
        print("请求成功：" + code.toString() + "\n" + "请求信息" + msg + "\n" + "数据" + data);
        setState(() {
          this.homeTitle = data;
        });
      },
      errorCallBask: (int code, String msg) {
        print("ErrCode:" + code.toString() + "\n" + "Errmsg:" + msg);
      },
    );
  }
}
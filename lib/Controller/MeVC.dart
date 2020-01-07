import 'package:flutter/material.dart';

class MeVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return MePageVC();
  }
}

class MePageVC extends State<MeVC> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ME",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Im, MeVC"),
      ),
    );
  }
}
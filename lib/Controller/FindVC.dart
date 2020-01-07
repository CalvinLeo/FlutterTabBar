import 'package:flutter/material.dart';

class FindVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FindPageVC();
  }
}

class FindPageVC extends State<FindVC> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text("FIND", 
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Im, FindVC"),
      ),
    );
  }
}
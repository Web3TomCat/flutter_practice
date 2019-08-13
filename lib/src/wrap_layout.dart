//流式布局  添加功能

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapLayoutDemo extends StatefulWidget {
  @override
  _WrapLayoutDemoState createState() => _WrapLayoutDemoState();
}

class _WrapLayoutDemoState extends State<WrapLayoutDemo> {

  List<Widget> list;
  int _index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = 0;
    list = List<Widget>()..add(buildAddBottom());
  }

  Widget buildAddBottom(){
    return GestureDetector(
      onTap: (){
        if(list.length < 9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
            _index++;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
          child: Center(child: Text('第$_index'+'个',style:TextStyle(color: Colors.red)),),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: Center(
        child: Opacity(
          child:Container(
            height: height/2,
            width: width,
            color: Colors.green,
            child: Wrap(
              children: list,
              spacing: 20.0,
            ),
          ),
          opacity: .5,
        ),
      ),
    );
  }
}
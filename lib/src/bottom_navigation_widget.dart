import 'package:flutter/material.dart';

import 'pages/email_screen.dart';
import 'pages/home_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/mine_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _btmColor = Colors.red;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(MineScreen());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: _btmColor),
            title: Text('Home',style: TextStyle(color: _btmColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email,color: _btmColor),
            title: Text('Email',style: TextStyle(color: _btmColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages,color: _btmColor),
            title: Text('Pages',style: TextStyle(color: _btmColor),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay,color: _btmColor),
            title: Text('Mine',style: TextStyle(color: _btmColor),)
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
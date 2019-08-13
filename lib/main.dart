import 'package:flutter/material.dart';
import 'package:flutter_practice/src/bezier_line.dart';
import 'package:flutter_practice/src/custom_bottom.dart';
import 'package:flutter_practice/src/drag_box.dart';
import 'package:flutter_practice/src/each_views.dart';
import 'package:flutter_practice/src/expansion_panel_list.dart';
import 'package:flutter_practice/src/frosted_glass.dart';
import 'package:flutter_practice/src/keep_alive_tab_bar.dart';
import 'package:flutter_practice/src/pages.dart';
import 'package:flutter_practice/src/search_bar.dart';
import 'package:flutter_practice/src/splash_screen.dart';
import 'package:flutter_practice/src/wrap_layout.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "bottom nav bar",
      theme: ThemeData.dark(),
      // home: BottomNavigationWidget(),
      // home: CustomBottom(),
      // home:FrostedGlass(),
      // home:KeepAliveTabBar(),
      // home: SearchBar(),
      // home: WrapLayoutDemo(),
      // home:ExpansionPanelListDemo(),
      // home: BezierLine(),
      // home: SplashScreen(),
      home: DragBox(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title:"bottom nav bar",
//       theme: ThemeData.dart(),
//       home: BottomNavigationWidget()
//     );
//   }
// }



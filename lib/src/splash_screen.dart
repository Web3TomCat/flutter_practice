import 'package:flutter/material.dart';

import 'index_home.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => IndexHome()),
          (route) => route == null
        );
      }
    });
    _controller.forward(); //动画开始执行
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  var img = 'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(img,scale: 2.0,fit:BoxFit.cover),
    );
  }
}



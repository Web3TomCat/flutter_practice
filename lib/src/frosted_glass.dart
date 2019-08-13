//毛玻璃效果

import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:ui';

const imgurl = 'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';


class FrostedGlass extends StatefulWidget {
  @override
  _FrostedGlassState createState() => _FrostedGlassState();
}

class _FrostedGlassState extends State<FrostedGlass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('毛玻璃效果'),

      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(imgurl),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: prefix0.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                child: Opacity(
                  opacity: .5,
                  child: Container(
                    width: 750.0,
                    height: 300.0,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Center(
                      child: Text('毛玻璃',style: Theme.of(context).textTheme.display3,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
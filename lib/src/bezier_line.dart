//贝塞尔曲线

import 'package:flutter/material.dart';

class BezierLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottonLine1(),
            child: Container(
              color: Colors.red,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}

//一次贝塞尔曲线
class BottonLine1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    var centerHeight = size.height - 100;
    path.lineTo(0, 0);
    path.lineTo(0, centerHeight);
    var point1 = Offset(size.width/2,size.height);
    var point2 = Offset(size.width,centerHeight);
    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);
    path.lineTo(size.width, centerHeight);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
//二次贝塞尔曲线
class BottonLine2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path =  new Path();
    path.lineTo(0, 0);
    path.lineTo(0,size.height-40);

    var p1Start = Offset(size.width/4,size.height);
    var p1End = Offset(size.width/2.25,size.height-30);

    path.quadraticBezierTo(p1Start.dx, p1Start.dy, p1End.dx, p1End.dy);

    var p2Start = Offset(size.width/4*3,size.height-90);
    var p2End = Offset(size.width,size.height-40);
    path.quadraticBezierTo(p1Start.dx, p2Start.dy, p2End.dx, p2End.dy);
    

    path.lineTo(size.width,size.height-40);
    path.lineTo(size.width, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
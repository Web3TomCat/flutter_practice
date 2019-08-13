import 'package:flutter/material.dart';


class EachViews extends StatefulWidget {
  String _title;
  EachViews(this._title);
  @override
  _EachViewsState createState() => _EachViewsState();
}

class _EachViewsState extends State<EachViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget._title),
      ),
      body: Center(child: Text(widget._title),),
    );
  }
}


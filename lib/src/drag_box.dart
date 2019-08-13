
import 'package:flutter/material.dart';


class DragBox extends StatefulWidget {
  @override
  _DragBoxState createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
  Color _dColor = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DragBoxComponent(location:Offset(80,80) ,widgetColor:Colors.yellow),
          DragBoxComponent(location:Offset(180,80) ,widgetColor:Colors.blue),
          Center(
            child: DragTarget(
              onAccept: (Color color){
                _dColor = color;
              },
              builder: (context,candidateData,rejectData){
                  return Container(
                    width: 200,
                    height: 200,
                    color: _dColor,
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}






class DragBoxComponent extends StatefulWidget {
 
  final Offset location;
  final Color widgetColor;
  DragBoxComponent({Key key,this.location,this.widgetColor}):super(key:key);
  @override
  _DragBoxComponentState createState() => _DragBoxComponentState();
}

class _DragBoxComponentState extends State<DragBoxComponent> {
  
  Offset location = Offset(0.0,0.0);

  @override
  void initState() {
    super.initState();
    location = widget.location;

  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:location.dx,
      top:location.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 120,
          height: 120,
          color: widget.widgetColor,
        ),
        onDraggableCanceled: (Velocity velocity,Offset offset){
          setState(() {
            this.location = offset;
          });
        },
      ),
    );
  }
}
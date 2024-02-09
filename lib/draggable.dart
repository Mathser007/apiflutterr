import 'package:flutter/material.dart';

class Draggg extends StatefulWidget {
  const Draggg({super.key});

  @override
  State<Draggg> createState() => _DragggState();
}

class _DragggState extends State<Draggg> {
  int acceptdata = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Draggable(
            data: 10,
            feedback: Container(
              height: 150,
              width: 150,
              color: Colors.indigoAccent,
              child: Icon(Icons.directions_run),
            ),
            childWhenDragging: Container(
              height: 150,
              width: 150,
              color: Colors.purple,
              child: Text('child when dragging'),
            ),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.yellow,
              child: Text('Draggable'),
            ),
          ),
          DragTarget(
            builder: (BuildContext context, List<dynamic?> accepted,
                List<dynamic> rejected) {
              return Container(
                height: 150,
                width: 150,
                color: Colors.green,
                child: Text('Draggable times:$acceptdata'),
              );
            },
    onAccept: (int data) {
    setState(() {
    acceptdata += data;
    });
          }
          )],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Gesturedtctr extends StatefulWidget {
  const Gesturedtctr({super.key});

  @override
  State<Gesturedtctr> createState() => _GesturedtctrState();
}

class _GesturedtctrState extends State<Gesturedtctr> {
  String _text='Swipe me';
void _ontap(){
  setState(() {
    _text='Tapped';
    print('Tapped');
  });
}
void _onDoubleTap(){
  setState(() {
    _text='Double tapped';
    print('Double tapped');
  });
}
void _onHorizontalSwipe(SwipeDirection direction){
  setState(() {
  if (direction==SwipeDirection.left) {
    _text='Swiped left';
    print('Swiped left');
  }
  else{
    _text='Swiped right';
    print('Swiped right');
  }
  });
  void _onVerticalSwipe(SwipeDirection direction){
    setState(() {
      if (direction==SwipeDirection.down) {
        _text='Swiped down';
        print('Swiped down');
      }
      else{
        _text='Swiped up';
        print('Swiped up');
      }
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SimpleGestureDetector(
          onTap:_ontap,
          onDoubleTap: _onDoubleTap,
          onHorizontalSwipe:_onHorizontalSwipe,
          // onVerticalSwipe:_onVerticalSwipe ,
          child: Container(
                      height: 160.0,
                      width: 160.0,
                      color: Colors.indigo,
                      child: Center(
                        child: Text(
                          _text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                  ),
        ),
      ),
    );
  }
}

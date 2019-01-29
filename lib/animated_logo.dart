import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  final double size;

  const AnimatedLogo({Key key, this.size}) : super(key: key);
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation<double> rotationAnimation;
  double size = 0;
  double rotation = 0;
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation =
        Tween<double>(begin: 0, end: widget.size).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceInOut,
    ));
    rotationAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    controller.addListener(() {
      setState(() {
        size = animation?.value;
        rotation = rotationAnimation?.value;
        print('$size - $rotation');
      });
    });
    controller.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      child: Container(
        height: size,
        width: size,
        child: FlutterLogo(),
      ),
      transform: Matrix4.rotationZ(rotation),
    );
  }
}

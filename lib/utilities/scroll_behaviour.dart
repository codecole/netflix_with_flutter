import 'package:flutter/material.dart';

class MyScrollBehaviour extends ScrollBehavior {

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    return child;
//    return super.buildViewportChrome(context, child, axisDirection);
  }
}
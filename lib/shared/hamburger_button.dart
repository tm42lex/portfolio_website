import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;

class HamburgerButton extends   StatefulWidget {
  @required final ThemeData themeData;
  HamburgerButton({this.themeData, Key key}) : super(key : key);

  @override
  _HamburgerButton createState()=> _HamburgerButton();
}

class _HamburgerButton extends State<HamburgerButton> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  static const        fixedDuration = Duration(milliseconds: 720);
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: fixedDuration);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 30,
     width:  30,
     margin: const EdgeInsets.all(5),
     decoration: BoxDecoration(
       border : Border.all(
         color: widget.themeData.canvasColor,
       ),
     ),
     child: Center(
       child: AnimatedBuilder(
         animation: _controller,
         builder: (context, _) {
           return Transform.rotate(
             angle: _controller.value * math.pi / 2,
             child: ClipOval(
               child: MaterialButton(
                 highlightColor: Colors.transparent,
                 focusColor:     Colors.transparent,
                 hoverColor:     Colors.transparent,
                 splashColor:    Colors.transparent,
                 color:          widget.themeData.backgroundColor,
                 child:Icon(
                     FontAwesomeIcons.bars,
                     size: 25,
                     color: widget.themeData.canvasColor,
                   ),
                 onPressed: () {
                   if (! _controller.isAnimating) {
                     context.read(drawerOpacityStateNotifier).switchOnOff();
                     if (_controller.value == 0)
                       _controller.forward(from: 0);
                     else
                       _controller.reverse(from: fixedDuration.inMilliseconds + 0.0);
                   }
                 },
               ),
             ),
           );
         }
       ),
     ),
   );
  }
}
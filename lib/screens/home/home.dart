import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;
import 'package:portfolio_website/screens/home/home_profile_switch.dart';
import 'package:portfolio_website/screens/home/selfie.dart';
import 'package:portfolio_website/screens/home/sns_icons.dart';
import 'package:portfolio_website/screens/home/welcome_title/_welcome_title.dart';

class HomeHomeScreen extends HookWidget {
  @required final ThemeData theme;
  HomeHomeScreen({this.theme, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (rb.isComputerWidth(width)) {
      return _ChildCP( width);
    } else if (rb.isTabletWidth_Big(width)) {
      return _ChildTBLarge(width);
    } else if (rb.isTabletWidth_Small(width)){
      return _ChildTBSmall(width);
    } else {
      return _ChildSP(width);
    }
  }

  Widget _ChildCP(double width) {
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelfieContainer(),
                SNSIcons(theme: theme,),
              ],
            ),
            SizedBox(width: width / 2 / 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children : [
                WindowDisplaySwitch(),
                SizedBox(height: width / 2 / 15,),
                WelcomeCp(theme: theme,)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ChildTBLarge(double width) {
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelfieContainer(),
                SNSIcons(theme: theme,),
              ],
            ),
            SizedBox(width: width / 2 / 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children : [
                WindowDisplaySwitch(),
                SizedBox(height: width / 2 / 15,),
                WelcomeTB(theme: theme,)
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _ChildTBSmall(double width) {
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:   MainAxisAlignment.start,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            WindowDisplaySwitch(),
            SizedBox(height: width / 2 / 15,),
            SelfieContainer(),
            SNSIcons(theme: theme,),
            SizedBox(height: width / 2 / 15,),
            WelcomeSP(theme: theme,),
          ],
        ),
      ),
    );
  }

  Widget _ChildSP(double width) {
    return Container(
      width: width ,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:   MainAxisAlignment.start,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            WindowDisplaySwitch(),
            SizedBox(height: width / 2 / 15,),
            SelfieContainer(),
            SNSIcons(theme: theme,),
            SizedBox(height: width / 2 / 15,),
            WelcomeSP(theme: theme,),
          ],
        ),
      ),
    );
  }
}
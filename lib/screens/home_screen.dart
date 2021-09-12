import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/screens/home/home.dart';
import 'package:portfolio_website/screens/home/profile_section.dart';
import 'package:portfolio_website/services/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key  key}) : super(key : key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller     = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return _HomeScreenChild(controller: _controller,);
  }
}

class _HomeScreenChild extends HookWidget{
  @required final PageController controller;
  _HomeScreenChild({this.controller, Key key}) : super(key : key);


  @override
  Widget build(BuildContext context) {

    var width   = MediaQuery.of(context).size.width;
    var height  = MediaQuery.of(context).size.height;
    final int       _pageIndex   = useProvider(homeWindowStateProvider).index;
    final ThemeData theme        = useProvider(darkLightThemeProvider);

    final List<Widget> _pages = [
      IndexPageScreen(theme: theme,),
      ProfileSection(theme: theme,),
    ];

    return Container(
      width:  width,
      height: height,
      child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _pages[_pageIndex];
          }
      ),
    );
  }
}

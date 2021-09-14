import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_website/screens/home_screen.dart';
import 'package:portfolio_website/screens/portfolio_screen.dart';
import 'package:portfolio_website/shared/appbar_ellipsis_button.dart';
import 'package:portfolio_website/shared/drawer/_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio_website/shared/hamburger_button.dart';
import 'package:portfolio_website/shared/sun_moon_icon.dart';
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;

class ScreenFrame extends StatefulWidget {
  ScreenFrame({Key? key}) : super(key : key);


  @override
  _ScreenFrame createState() => _ScreenFrame();
}

class _ScreenFrame extends State<ScreenFrame> {

  late bool           _completedInit;
  late PageController _controller;


  @override
  void initState() {
    super.initState();
    _completedInit = false;
    _controller     = PageController(initialPage: 0);
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_completedInit) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        context.read(darkLightModeProvider).initializeUserDarkLightMode(Theme.of(context).primaryColor);
        setState(() {
          _completedInit = true;
        });
      });
    }
    if (_completedInit)
      return _ScreenFrameChild(controller: _controller,);
    else
      return Container();
  }
}

class _ScreenFrameChild extends HookWidget {
  final PageController controller;
  const _ScreenFrameChild({required this.controller, Key? key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final theme         = useProvider(darkLightThemeProvider);
    final _pageIndex    = useProvider(screenStateProvider).index;
    var   width         = MediaQuery.of(context).size.width;
    var   height        = MediaQuery.of(context).size.height;
    final List<Widget> _pages = [
      HomeScreen(),
      PortfolioScreen(),
    ];
    final pageViewBuilder =  Container(
      width: width,
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

    return Scaffold(
      appBar: AppBar(
        elevation:       0.0,
        backgroundColor: theme.colorScheme.background,
        leading: HamburgerButton(theme: theme,),
        actions: [
          SunMoonIcons(),
          EllipsisButton(theme: theme),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (rb.isComputerWidth(width) || rb.isTabletWidth(width) || rb.isTabletWidth_Small(width)) {
            return Container(
              color: theme.colorScheme.background,
              height: height,
              width: width,
              child: Stack(
                children: [
                  pageViewBuilder,
                  Positioned(left: 0, child: VerticalDrawer()),
                ],
              ),
            );
          } else {
            return Container(
              color: theme.colorScheme.background,
              child: Stack(
                children: [
                  pageViewBuilder,
                  Positioned(
                      bottom: 0.0,
                      child: HorizontalNavbar()
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'drawer_items.dart';

class VerticalDrawer extends HookWidget {
  const VerticalDrawer({Key? key}) : super(key : key);

  final Duration fixedDuration = const Duration(milliseconds: 420);

  @override
  Widget build(BuildContext context) {
    final palette           = useProvider(darkLightThemeProvider);
    final opacity           = useProvider(drawerOpacityStateProvider);
    final currentPage       = useProvider(screenStateProvider);
    final currentWindowHome = useProvider(homeWindowStateProvider);
    final enabled           = (opacity == 1.0);

    return AnimatedOpacity(
      opacity:  opacity,
      duration: fixedDuration,
      curve:    Curves.easeIn,
      child: Container(
        width: 200,
        height: 700,
          child: Column(
            children: [
              DrawerItem(
                theme:        palette,
                type:         ScreenStateType.home,
                enabled:      enabled,
                currentType:  currentPage,
                subDrawer:    Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SubDrawerItem(
                      theme:          palette,
                      type:           HomeWindowStateType.profile,
                      subWindowType:  SubWindowType.HomeWindowStateType,
                      enabled:        enabled,
                      currentType:    currentWindowHome,
                    ),
                  ],
                ),
              ),
              DrawerItem(
                theme:        palette,
                type:         ScreenStateType.portfolio,
                enabled:      enabled,
                currentType:  currentPage,
                subDrawer:    null,
              ),
            ],
          ),
        ),
    );
  }
}

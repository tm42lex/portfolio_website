import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'drawer_items.dart';


class HorizontalDrawer extends HookWidget {
  const HorizontalDrawer({Key? key}) : super(key : key);

  final Duration fixedDuration = const Duration(milliseconds: 420);

  @override
  Widget build(BuildContext context) {
    final theme             = useProvider(darkLightThemeProvider);
    final opacity           = useProvider(drawerOpacityStateProvider);
    final currentPage       = useProvider(screenStateProvider);
    final pageNumber        = ScreenStateType.values.length;
    final enabled           = (opacity == 1.0);
    var   width             = MediaQuery.of(context).size.width;

    return AnimatedOpacity(
      opacity:  opacity,
      duration: fixedDuration,
      curve:    Curves.easeIn,
      child: Container(
        height: 60,
        width:  width,
        color: theme.colorScheme.background,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              DrawerItem(
                theme:        theme,
                type:         ScreenStateType.home,
                enabled:      enabled,
                currentType:  currentPage,
                subDrawer:    null,
              ),
              SizedBox(width: width / pageNumber / 6,),
              DrawerItem(
                theme:        theme,
                type:         ScreenStateType.portfolio,
                enabled:      enabled,
                currentType:  currentPage,
                subDrawer:    null,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

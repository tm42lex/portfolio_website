import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/dark_light_state/enums.dart';
import 'package:flutter/rendering.dart';

class SunMoonIcons extends HookWidget {
  SunMoonIcons({Key key}) : super(key : key);

  final Duration fixedDuration = const Duration(milliseconds: 420);

  @override
  Widget build(BuildContext context) {
    final darkLightState  = useProvider(darkLightStateProvider);
    final sunOpacity      = (darkLightState == DarkLightMode.light)  ? 1.0 : 0 ;
    final moonOpacity     = (darkLightState == DarkLightMode.dark)   ? 1.0 : 0 ;
    return Container(
      padding: const EdgeInsets.all(5),
      margin:  const EdgeInsets.only(top : 10, right: 20),
      child: Stack(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedOpacity(
              opacity: sunOpacity,
              duration: fixedDuration,
              child: Container(
                child: GestureDetector(
                    onTap: () {
                      context.read(darkLightModeProvider).switchMode();
                    },
                    child: Icon(FontAwesomeIcons.solidSun, color: Colors.amber, size : 30)
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedOpacity(
              opacity: moonOpacity,
              duration: fixedDuration,
              child: Container(
                child: GestureDetector(
                    onTap: () {
                      context.read(darkLightModeProvider).switchMode();
                    },
                    child: Icon(FontAwesomeIcons.solidMoon, color: Colors.amber, size : 30)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'package:portfolio_website/services/conversions.dart' as conv;
import 'package:portfolio_website/services/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerItem extends StatelessWidget {
   final ThemeData       theme;
   final Widget?          subDrawer;
   final ScreenStateType type;
   final bool            enabled;
   final ScreenStateType currentType;
  const DrawerItem({required this.theme, required this.subDrawer, required this.currentType, required this.type,
    required this.enabled, Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children : [
          Row(
            children: [
              SizedBox(width: 20,),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                decoration: BoxDecoration(
                  gradient : LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      HSLColor.fromColor(theme.colorScheme.primary).withLightness(.8).toColor(),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(42),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  focusColor:     Colors.transparent,
                  hoverColor:     Colors.transparent,
                  splashColor:    Colors.transparent,
                  child: MouseRegion(
                    cursor: (enabled) ? SystemMouseCursors.click : SystemMouseCursors.basic,
                    child: Text(
                      conv.screenStateTypeToString(type),
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: theme.colorScheme.onPrimary,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ).copyWith(
                        fontFamilyFallback: [
                          'NotoSansJP',
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    if(enabled) {
                      context.read(screenStateNavigationModeProvider).jumpToType(type);
                      context.read(homeWindowStateNavigationModeProvider).resetToInitPage();
                    }
                  },
                ),
              ),
            ],
          ),
          if (subDrawer != null) ... [
            subDrawer!,
          ]
        ],
      ),
    );
  }
}

class SubDrawerItem extends StatelessWidget {
   final ThemeData theme;
   final dynamic type;
   final SubWindowType subWindowType;
   final bool enabled;
   final dynamic currentType;

  const SubDrawerItem({required this.theme, required this.subWindowType, required this.currentType, required this.type,
    required this.enabled, Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 40,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
            decoration: BoxDecoration(
              gradient : LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  theme.colorScheme.secondary,
                  HSLColor.fromColor(theme.colorScheme.secondary).withLightness(.8).toColor(),
                ],
              ),
              borderRadius: BorderRadius.circular(42),
            ),
            child: MaterialButton(
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: MouseRegion(
                cursor: (enabled) ? SystemMouseCursors.click : SystemMouseCursors.basic,
                child: Text(
                  conv.subWindowStateTypeToString(type, subWindowType),
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: theme.colorScheme.onSecondary,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                  ).copyWith(
                    fontFamilyFallback: [
                      'NotoSansJP',
                    ],
                  ),
                ),
              ),
              onPressed: () {
                if (enabled) {
                  if (subWindowType == SubWindowType.HomeWindowStateType) {
                    context.read(screenStateNavigationModeProvider).jumpToType(ScreenStateType.home);
                    context.read(homeWindowStateNavigationModeProvider).jumpToType(type);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

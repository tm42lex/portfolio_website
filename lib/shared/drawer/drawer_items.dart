import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'package:portfolio_website/services/conversions.dart' as conv;
import 'package:portfolio_website/services/navigation_state/home_window_state/home_profile_navigation_state.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerItem extends StatelessWidget {
  @required final ThemeData       theme;
  @required final Widget          subDrawer;
  @required final ScreenStateType type;
  @required final bool            enabled;
  @required final ScreenStateType currentType;
  const DrawerItem({this.theme, this.subDrawer, this.currentType, this.type,  this.enabled, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = (currentType == type) ? theme.primaryColor : theme.backgroundColor;
    final accentColor  = (currentType == type) ? theme.backgroundColor : theme.primaryColor;

    if (subDrawer == null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child:  Row(
          children: [
            SizedBox(width: 20,),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                decoration: BoxDecoration(
                  gradient : LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      (type == currentType) ? theme.primaryColor.withOpacity(1) : theme.backgroundColor,
                      (type == currentType) ? theme.buttonColor.withOpacity(1) : theme.backgroundColor,

                    ],
                  ),
                  border: Border.all(color: accentColor),
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
                        color: accentColor.withOpacity(1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
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
      );
    } else {
      return Container(
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
                        (type == currentType) ? theme.primaryColor.withOpacity(1) : theme.backgroundColor,
                        (type == currentType) ? theme.buttonColor.withOpacity(1)  : theme.backgroundColor,

                      ],
                    ),
                    border: Border.all(color: accentColor),
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
                          color: accentColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
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
            subDrawer,
          ],
        ),
      );
    }
  }
}

class SubDrawerItem extends StatelessWidget {
  @required final ThemeData theme;
  @required final dynamic type;
  @required final SubWindowType subWindowType;
  @required final bool enabled;
  @required final dynamic currentType;

  const SubDrawerItem({this.theme, this.subWindowType, this.currentType, this.type, this.enabled, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = (currentType == type) ? theme.buttonColor : theme.backgroundColor;
    final accentColor = (currentType == type) ? theme.backgroundColor : theme.buttonColor;
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 40,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(42),
              border: Border.all(width: 1, color: accentColor),
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
                    color: accentColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
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
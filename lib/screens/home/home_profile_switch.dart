import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_website/services/conversions.dart' as conv;
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';

class WindowDisplaySwitch extends HookWidget {
  WindowDisplaySwitch({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final palette = useProvider(darkLightThemeProvider);
    final currentWindowHome = useProvider(homeWindowStateProvider);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SwitchItem(
            theme:        palette,
            currentType:  currentWindowHome,
            type:         HomeWindowStateType.home,
          ),
          _SwitchItem(
            theme:        palette,
            currentType:  currentWindowHome,
            type:         HomeWindowStateType.profile,
          ),
        ],
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  @required final ThemeData               theme;
  @required final HomeWindowStateType     currentType;
  @required final HomeWindowStateType     type;
  const _SwitchItem({this.theme, this.type, this.currentType, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final bool  enabled       = (type == currentType);
    final Color primaryColor  = (enabled) ? theme.canvasColor    : theme.backgroundColor;
    final Color textColor     = (enabled) ? theme.backgroundColor : theme.canvasColor;
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: (enabled) ? primaryColor : textColor,
        border: Border.all(color : theme.canvasColor, width : 1),
      ),
      child: MaterialButton(
        color: primaryColor,
        elevation: 0,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: MouseRegion(
          cursor: (enabled) ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: SelectableText(
            conv.homeWindowStateTypeToString(type),
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: textColor,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {
          if (!enabled) {
            context.read(homeWindowStateNavigationModeProvider).jumpToType(type);
          }
        },
      ),
    );
  }
}
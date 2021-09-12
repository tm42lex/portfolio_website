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
    final theme              = useProvider(darkLightThemeProvider);
    final currentWindowHome  = useProvider(homeWindowStateProvider);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SwitchItem(
            theme:        theme,
            currentType:  currentWindowHome,
            type:         HomeWindowStateType.home,
          ),
          _SwitchItem(
            theme:        theme,
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
    final Color primaryColor  = theme.colorScheme.primary;
    final Color textColor     = theme.colorScheme.onPrimary;
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: (enabled) ? primaryColor : textColor,
        shape: BoxShape.rectangle,
      ),
      child: MaterialButton(
        color: (enabled) ? primaryColor : textColor,
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
              color:  (enabled) ? textColor : primaryColor,
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
          if (!enabled) {
            context.read(homeWindowStateNavigationModeProvider).jumpToType(type);
          }
        },
      ),
    );
  }
}

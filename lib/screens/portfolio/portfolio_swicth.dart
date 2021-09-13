import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_website/services/conversions.dart' as conv;
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';


class WindowDisplaySwitch extends HookWidget {
  WindowDisplaySwitch({Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(darkLightThemeProvider);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SwitchItem(
            theme:        theme,
            type:         PortfolioWindowStateType.portfolio,
          ),
        ],
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  final ThemeData                    theme;
  final PortfolioWindowStateType     type;
  const _SwitchItem({required this.theme, required this.type,  Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor  = theme.colorScheme.primary;
    final Color textColor     = theme.colorScheme.onPrimary;
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.rectangle,
      ),
      child: MaterialButton(
        color: primaryColor,
        elevation: 0,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            conv.portfolioWindowStateTypeToString(type),
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: textColor,
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
          return ;
        },
      ),
    );
  }
}

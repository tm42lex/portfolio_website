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
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SwitchItem(
            theme:        palette,
            type:         PortfolioWindowStateType.portfolio,
          ),
        ],
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  @required final ThemeData                    theme;
  @required final PortfolioWindowStateType     type;
  const _SwitchItem({this.theme, this.type,  Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor  = theme.canvasColor ;
    final Color textColor     = theme.backgroundColor;
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color:  primaryColor ,
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
          cursor: SystemMouseCursors.click,
          child: Text(
            conv.portfolioWindowStateTypeToString(type),
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: textColor,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
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
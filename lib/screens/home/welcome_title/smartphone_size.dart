import 'package:flutter/material.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:google_fonts/google_fonts.dart';

class WelcomeSP extends StatelessWidget {
  @required final ThemeData theme;
  const WelcomeSP({this.theme, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        mainAxisAlignment:   MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          SelectableText(
            paragraph.welcome,
            style: GoogleFonts.sourceSansPro(
              fontSize:   60,
              color:      theme.colorScheme.primary,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
            ).copyWith(
              fontFamilyFallback: [
                'NotoSansJP',
              ],
            ),
          ),
          SelectableText(
            paragraph.welcomeIntro,
            style:  GoogleFonts.sourceSansPro(
              fontSize: 90,
              color:    theme.colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ).copyWith(
              fontFamilyFallback: [
                'NotoSansJP',
              ],
            ),
          )
        ],
      ),
    );
  }
}

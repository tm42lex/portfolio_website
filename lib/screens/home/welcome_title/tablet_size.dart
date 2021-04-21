import 'package:flutter/material.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:google_fonts/google_fonts.dart';

class WelcomeTB extends StatelessWidget {
  @required final ThemeData theme;
  const WelcomeTB({this.theme, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment:   MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          SelectableText(
            paragraph.welcome,
            style: GoogleFonts.sourceSansPro(
              fontSize:   50,
              color:      theme.accentColor,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
            ),
          ),
          SelectableText(
            paragraph.welcomeIntro,
            style:  GoogleFonts.sourceSansPro(
              fontSize: 70,
              color:    theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
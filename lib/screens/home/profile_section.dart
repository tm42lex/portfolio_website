import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:portfolio_website/screens/home/home_profile_switch.dart';
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;
import 'package:portfolio_website/constants.dart' as appConst;
import 'package:portfolio_website/services/navigation_state/enums.dart';

class ProfileSection extends StatelessWidget {
  @required final ThemeData theme;
 const ProfileSection({required this.theme, Key ? key}) : super(key : key);

 @override
 Widget build(BuildContext context) {
   var width                = MediaQuery.of(context).size.width;
   var isSmallScreen        = (rb.isTabletWidth_Small(width) || rb.isSmartphoneWidth(width));
   var marginRightDistance  = (appConst.pageWindowMax - HomeWindowStateType.values.length) * 100.0;
   var marginLeft           = (isSmallScreen) ? 0.0 : 270.0 + (width / 2 / 10);
   var marginRight          = (isSmallScreen) ? 0.0 : marginRightDistance;
   return Container(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin:EdgeInsets.only(left: marginLeft, right: marginRight),
                child: WindowDisplaySwitch(),
            ),
            SizedBox(height: width / 2 / 15,),
            Container(
              width:  isSmallScreen ? width * 0.8 : width * 0.5,
              padding:  isSmallScreen ? const EdgeInsets.all(20) : const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(width: 1, color: theme.colorScheme.secondary),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  _ProfileTitle(
                    theme: theme,
                    title: "About Me",
                    isSmallFont: isSmallScreen,
                  ),
                  SizedBox(height: width / 2 / 30,),
                  _ProfileParagraph(
                    theme:  theme,
                    content: paragraph.profileGeneral,
                    isSmallFont: isSmallScreen,
                  ),
                  SizedBox(height: width / 2 / 30,),
                  _ProfileTitle(
                    theme: theme,
                    title: "Skills",
                    isSmallFont: isSmallScreen,
                  ),
                  SizedBox(height: width / 2 / 30,),
                  _ProfileParagraph(
                    theme:  theme,
                    content: paragraph.profileSkills,
                    isSmallFont: isSmallScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
   );
  }
}

class _ProfileTitle extends StatelessWidget {
  final String    title;
  final ThemeData theme;
  final bool      isSmallFont;
  _ProfileTitle({required this.theme, required this.title, required this.isSmallFont, Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      title,
      style: GoogleFonts.sourceSansPro(
        fontSize:   (isSmallFont) ? 40 : 60,
        color:      theme.colorScheme.primary,
        decoration: TextDecoration.underline,
        fontWeight: (isSmallFont) ? FontWeight.w400 : FontWeight.w600,
      ),
    );
  }
}

class _ProfileParagraph extends StatelessWidget {
  final String    content;
  final ThemeData theme;
  final bool      isSmallFont;
   _ProfileParagraph({required this.theme, required this.content, required this.isSmallFont, Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      content,
      style: GoogleFonts.sourceSansPro(
        fontSize:   20,
        color:      theme.colorScheme.onBackground,
        decoration: TextDecoration.none,
        fontWeight: (isSmallFont) ? FontWeight.w300 : FontWeight.w400,
      ).copyWith(
        fontFamilyFallback: [
          'NotoSansJP',
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  @required final String    title;
  @required final bool      isSmallFont;
  @required final ThemeData theme;
  const SectionTitle({this.title, this.isSmallFont, this.theme, Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
   return   Container(
     height: 50,
     child: Text(
       'Profile',
        style: TextStyle(
          fontSize:   (isSmallFont) ? 30 : 40,
          color:      theme.canvasColor,
          decoration: TextDecoration.underline,
          fontWeight: (isSmallFont) ? FontWeight.w300 : FontWeight.w400,
        ),
     ),
   );
  }
}
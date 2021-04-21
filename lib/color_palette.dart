import 'package:flutter/material.dart';

const terminalThemeBlack = Colors.black;
const terminalThemeGreen = Color.fromRGBO(102, 255, 102, 1);
const terminalThemeAmber = Color.fromRGBO(255, 176, 0, 1);
const notionThemeWhite   = Colors.white;
const notionThemeNavy    = Color.fromRGBO(0, 30, 105, 1);
const notionThemeYellow  = Color.fromRGBO(248, 180, 53, 1);
const netProtectionsPink = Color.fromRGBO(232, 44, 132, 1);
const netProtectionsBlue = Color.fromRGBO(28, 174, 225, 1);
const lightBlack         = Color.fromRGBO(45, 41, 38, 1);
const lightRed           = Color.fromRGBO(233, 75, 60, 1);
const lightBlue          = Color.fromRGBO(15, 139, 255, 1);
const directorsCutBlue   = Color.fromRGBO(44,105,209, 1);
const directorsCutLBlue  = Color.fromRGBO(10,188,249, 1);
const lightGreen         = Color.fromRGBO(32, 191, 85, 1);
const lightLightBlue     = Color.fromRGBO(1, 186, 239, 1);
const lightGray          = Color.fromRGBO(168, 168, 168, 1);

///
///Button Color : button gradation color (start) -> (end : primaryColor)
///

final lightTheme = ThemeData(
  primaryColor:    netProtectionsBlue,
  backgroundColor: notionThemeWhite,
  buttonColor:     netProtectionsPink,
  accentColor:     netProtectionsPink,
  canvasColor:     notionThemeNavy,
);

final darkTheme = ThemeData(
  accentColor:    Colors.white70,
  backgroundColor: terminalThemeBlack,
  buttonColor: Color.fromRGBO(246, 112, 98, 1),
  // primaryColor:     Color.fromRGBO(113,142,221, 1),
  primaryColor: lightRed,
  canvasColor:     notionThemeWhite,
);



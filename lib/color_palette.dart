import 'package:flutter/material.dart';

const perfectBlack       = Colors.black;
const perfectWhite       = Colors.white;
const notionThemeNavy    = Color.fromRGBO(0, 30, 105, 1);

const vividPurple        = Color.fromRGBO(123, 67, 235, 1);
const lightBlue          = Color.fromRGBO(95, 172, 235, 1);
const darkNavy           = Color.fromRGBO(3, 27, 78, 1);
const blueWhite          = Color.fromRGBO(236, 245, 255, 1);
const lightRed           = Color.fromRGBO(233, 75, 60, 1);

const deepDarkNavy       = Color.fromRGBO(32, 41, 70, 1);
const lightPurple        = Color.fromRGBO(184, 193, 236, 1);
const lightPink          = Color.fromRGBO(238, 187, 195, 1);
const offWhite           = Color.fromRGBO(255, 255, 254, 1);

///
///Button Color : button gradation color (start) -> (end : primaryColor)
///

final lightTheme = ThemeData(
  colorScheme: ColorScheme(
    primary         : vividPurple,
    primaryVariant  : vividPurple,
    background      : blueWhite,
    secondary       : lightBlue,
    secondaryVariant: lightBlue,
    onBackground    : darkNavy,
    onPrimary       : perfectWhite,
    onSecondary     : perfectWhite,
    surface         : perfectBlack,
    onSurface       : perfectBlack,
    onError         : perfectBlack,
    error           : perfectBlack,
    brightness      : Brightness.light,
  ),
);

final darkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary         : lightPink,
      primaryVariant  : lightPink,
      background      : deepDarkNavy,
      secondaryVariant: lightPurple,
      secondary       : lightPurple,
      onBackground    : offWhite,
      onPrimary       : deepDarkNavy,
      onSecondary     : deepDarkNavy,
      surface         : perfectBlack,
      onSurface       : perfectBlack,
      onError         : perfectBlack,
      error           : perfectBlack,
      brightness      : Brightness.dark,
    ),
);



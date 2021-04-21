import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'enums.dart';
import 'package:portfolio_website/color_palette.dart' as cp;

class DarkLightModeModel {
  @required final DarkLightMode mode;
  @required final ThemeData     theme;
  DarkLightModeModel({this.mode, this.theme});
}

class DarkLightModeNotifier extends StateNotifier<DarkLightModeModel> {
  DarkLightModeNotifier() : super(_initialState);

  static final _initialState = DarkLightModeModel(
    mode : DarkLightMode.light,
    theme: cp.lightTheme,
  );

  void initializeUserDarkLightMode(Color initPrimaryColor) {
    if (initPrimaryColor == cp.lightTheme.primaryColor) {
      state = DarkLightModeModel(
        mode: DarkLightMode.light,
        theme: cp.lightTheme,
      );
    } else {
      state = DarkLightModeModel(
          mode: DarkLightMode.dark,
          theme: cp.darkTheme,
      );
    }
  }

  void switchMode () {
    if (state.mode == DarkLightMode.light) {
      state = DarkLightModeModel(
        mode: DarkLightMode.dark,
        theme: cp.darkTheme,
      );
    } else {
      state = DarkLightModeModel(
        mode : DarkLightMode.light,
        theme: cp.lightTheme,
      );
    }
  }
}
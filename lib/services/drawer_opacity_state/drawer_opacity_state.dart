import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerOpacityModel {
  @required final opacity;
  DrawerOpacityModel({this.opacity});
}

class DrawerOpacityModelNotifier extends StateNotifier<DrawerOpacityModel> {
  DrawerOpacityModelNotifier() : super(_initialState);

  static final _initialState = DrawerOpacityModel(
    opacity: 0.0,
  );

  void switchOnOff () {
    if (state.opacity == 0.0) {
      state = DrawerOpacityModel(
        opacity: 1.0
      );
    } else {
      state = DrawerOpacityModel(
          opacity: 0.0
      );
    }
  }
}
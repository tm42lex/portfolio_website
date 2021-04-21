import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/services/dark_light_state/dark_light_state.dart';
import 'package:portfolio_website/services/dark_light_state/enums.dart';
import 'package:portfolio_website/services/navigation_state/home_window_state/home_profile_navigation_state.dart';
import 'package:portfolio_website/services/navigation_state/screen_state/home_portfolio_navigation_state.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'package:portfolio_website/services/drawer_opacity_state/drawer_opacity_state.dart';
import 'package:flutter/material.dart';

/// Monitoring Dark Mode || Light Mode
final darkLightModeProvider = StateNotifierProvider<DarkLightModeNotifier>(
      (ref) => DarkLightModeNotifier(),
);

final _darkLightStateProvider = Provider<DarkLightMode>(
        (ref) {
      return ref.watch(darkLightModeProvider.state).mode;
    }
);

final darkLightStateProvider = Provider<DarkLightMode>(
        (ref){
      return ref.watch(_darkLightStateProvider);
    }
);

final _darkLightThemeProvider = Provider<ThemeData>(
        (ref) {
      return ref.watch(darkLightModeProvider.state).theme;
    }
);

final darkLightThemeProvider = Provider<ThemeData>(
        (ref){
      return ref.watch(_darkLightThemeProvider);
    }
);


///Monitoring Which Page an User is At

final screenStateNavigationModeProvider = StateNotifierProvider<ScreenStateTypeNotifier>(
      (ref) => ScreenStateTypeNotifier(),
);

final _screenStateProvider = Provider<ScreenStateType> (
        (ref) {
      return ref.watch(screenStateNavigationModeProvider.state).type;
    }
);

final screenStateProvider = Provider<ScreenStateType>(
        (ref) {
      return ref.watch(_screenStateProvider);
    }
);


///Monitoring Which Page within Home Window an User is At

final homeWindowStateNavigationModeProvider = StateNotifierProvider<HomeWindowStateTypeNotifier>(
    (ref) => HomeWindowStateTypeNotifier(),
);

final _homeWindowStateProvider = Provider<HomeWindowStateType> (
    (ref) {
      return ref.watch(homeWindowStateNavigationModeProvider.state).type;
    }
);

final homeWindowStateProvider = Provider<HomeWindowStateType> (
    (ref) {
      return ref.watch(_homeWindowStateProvider);
    }
);

///Monitoring Whether Drawer is Turned On or Not

final drawerOpacityStateNotifier = StateNotifierProvider<DrawerOpacityModelNotifier>(
      (ref) => DrawerOpacityModelNotifier(),
);

final _drawerOpacityStateProvider = Provider<double> (
        (ref) {
      return ref.watch(drawerOpacityStateNotifier.state).opacity;
    }
);

final drawerOpacityStateProvider = Provider<double> (
        (ref) {
      return ref.watch(_drawerOpacityStateProvider);
    }
);

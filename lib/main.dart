import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/screens/screen_frame.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:sizer/sizer_util.dart';
import 'package:portfolio_website/color_palette.dart' as palette;

void main() {
  runApp(
    const ProviderScope(
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key }) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title:    'MyPortfolioSite',
                theme:     palette.lightTheme,
                darkTheme: palette.darkTheme,
                home:      ScreenFrame(),
              );
            }
        );
      },
    );
  }
}

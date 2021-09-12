import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/screens/screen_frame.dart';
import 'package:portfolio_website/color_palette.dart' as palette;

void main() {
  LicenseRegistry.addLicense(() async* {
    final licenseNotoSansJP = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], licenseNotoSansJP);
  });
  runApp(
    const ProviderScope(
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPortfolioSite',
      theme: palette.lightTheme,
      darkTheme: palette.darkTheme,
      home: ScreenFrame(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_website/screens/portfolio/card_outline.dart';
import 'package:portfolio_website/services/navigation_state/portfolio_window_state/portfolio_window_state.dart';
import 'package:portfolio_website/services/provider.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;
import 'portfolio/portfolio_swicth.dart';
import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'package:portfolio_website/constants.dart' as appConst;

class PortfolioScreen extends HookWidget {
  const PortfolioScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    var width                    = MediaQuery.of(context).size.width;
    var height                   = MediaQuery.of(context).size.height;
    final ThemeData theme        = useProvider(darkLightThemeProvider);
    var isSmallScreen            = (rb.isSmartphoneWidth(width) || rb.isTabletWidth_Small(width));
    var marginRightDistance      = (appConst.pageWindowMax - PortfolioWindowStateType.values.length) * 100.0;
    var marginRight              = (isSmallScreen) ? 0.0 : marginRightDistance;
    var marginLeft               = (isSmallScreen) ? 0.0 : 270.0 + (width / 2 / 10);
    return Container(
      width:  width,
      height: height,
      color: theme.colorScheme.background,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin : EdgeInsets.only(left: marginLeft, right: marginRight),
              child: WindowDisplaySwitch()
          ),
          SizedBox(height: width / 2 / 15 ,),
          CardOutline(
            title:          paragraph.portfolioSiteTitle,
            introSentence:  paragraph.portfolioSiteDescription,
            imagePath:      paragraph.portfolioSiteImagePath,
            theme:          theme,
            appStoreUrl:    paragraph.portfolioAppStore,
            githubUrl:      paragraph.portfolioGithub,
            googlePlayUrl:  paragraph.portfolioGooglePlay,
          ),
        ],
      ),
    );
  }
}

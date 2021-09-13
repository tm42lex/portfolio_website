import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/portfolio/card_text.dart';
import 'package:portfolio_website/screens/portfolio/card_thumbnail.dart';
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;
import 'package:portfolio_website/screens/portfolio/icon_overlay.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;

class CardOutline extends StatelessWidget {
  final String    title;
  final String    introSentence;
  final String    imagePath;
  final ThemeData theme;
  final String    githubUrl;
  final String    appStoreUrl;
  final String    googlePlayUrl;
  const CardOutline({required this.title, required this.introSentence, required this.imagePath, required this.theme,
    required this.googlePlayUrl, required this.githubUrl, required this.appStoreUrl ,Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    var width         = MediaQuery.of(context).size.width;
    var isSmallScreen = (rb.isSmartphoneWidth(width) || rb.isTabletWidth_Small(width));
    return Stack(
      children: [
        Container(
          height: 250,
          margin: (isSmallScreen) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 200),
          width:  (isSmallScreen) ? width * 0.8 : width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 1, color: theme.colorScheme.secondary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: width / 2 / 15,),
              CardThumbnail(imagePath: imagePath, ),
              SizedBox(width: width / 2 / 15,),
              CardText(
                theme: theme,
                isSmallFont: isSmallScreen,
                title: title,
                introSentence: introSentence,
                width: (isSmallScreen) ? width * 0.8 - (width / 15 * 2.5) - 150 : width * 0.6 - (width / 15 *2.5) -150 ,
              ),
              SizedBox(width: width / 2 / 15,),
            ],
          ),
        ),
        Container(
          margin: (isSmallScreen) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 200),
          child: IconOverlay(
            appStoreUrl:    appStoreUrl,
            githubUrl:      githubUrl,
            googlePlayUrl:  googlePlayUrl,
            theme:          theme,
          ),
        ),
      ],
    );
  }
}


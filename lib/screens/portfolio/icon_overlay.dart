import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;

class IconOverlay extends StatefulWidget {
  @required final String?    githubUrl;
  @required final String?    appStoreUrl;
  @required final String?    googlePlayUrl;
  @required final ThemeData theme;
  IconOverlay({required this.githubUrl, required this.appStoreUrl, required this.googlePlayUrl, required this.theme, Key? key})  : super(key : key);

  final Duration fixedDuration = const Duration(milliseconds: 420);

  @override
  _IconOverlay createState()=>  _IconOverlay();
}

class _IconOverlay extends State<IconOverlay>  {

  late bool    enableAppStore;
  late bool    enableGooglePlay;
  late bool    enableGithub;
  late bool    isTapping;
  late double  screenOpacity;

  @override
  void initState() {
    super.initState();
    enableAppStore    = (widget.appStoreUrl   != null);
    enableGooglePlay  = (widget.googlePlayUrl != null);
    enableGithub      = (widget.githubUrl     != null);
    screenOpacity     = 0.0;
    isTapping         = false;
  }

  @override
  Widget build(BuildContext context) {
    var width         = MediaQuery.of(context).size.width;
    var isSmallScreen = (rb.isSmartphoneWidth(width) || rb.isTabletWidth_Small(width));
    return Material(
      color: widget.theme.colorScheme.onBackground.withOpacity(screenOpacity),
      child: InkWell(
        onTap: () {
          setState(() {
            if (!isTapping) {
              screenOpacity = .75;
              isTapping = true;
            } else {
              screenOpacity = 0;
              isTapping = false;
            }
          });
        },
        onHover: (isHovering) {
          if(isHovering) {
            setState(() {
              screenOpacity = .75;
            });
          } else if (!isHovering && !isTapping){
            setState(() {
              screenOpacity = 0;
            });
          }
        },
        child: AnimatedOpacity(
          duration: widget.fixedDuration,
          opacity: screenOpacity,
          child: Container(
            height  : 250,
            width   :  (isSmallScreen) ? width * 0.8 : width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Icon(
                  iconData:   FontAwesomeIcons.github,
                  iconColor:  enableGithub ? widget.theme.colorScheme.background : widget.theme.colorScheme.background.withOpacity(.2),
                  url:        widget.githubUrl,
                  message:    enableGithub ? paragraph.githubIconMessage : paragraph.comingSoon,
                  theme:      widget.theme,
                ),
                _Icon(
                  iconData:   FontAwesomeIcons.appStore,
                  iconColor:  enableAppStore ? widget.theme.colorScheme.background : widget.theme.colorScheme.background.withOpacity(.2),
                  url:        widget.appStoreUrl,
                  message:    enableAppStore ? paragraph.appStoreIconMessage : paragraph.comingSoon,
                  theme:      widget.theme,
                ),
                _Icon(
                  iconData:   FontAwesomeIcons.googlePlay,
                  iconColor:  enableGooglePlay ? widget.theme.colorScheme.background : widget.theme.colorScheme.background.withOpacity(.2),
                  url:        widget.googlePlayUrl,
                  message  :  enableGooglePlay ? paragraph.googlePlayIconMessage : paragraph.comingSoon,
                  theme:      widget.theme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}

class _Icon extends StatelessWidget {
  @required final IconData    iconData;
  @required final Color       iconColor;
  @required final ThemeData   theme;
  @required final String?     url;
  @required final String      message;
  const _Icon({required this.iconData, required this.url, required this.iconColor, required this.theme,
    required this.message,  Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return  Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
      ),
      textStyle : GoogleFonts.sourceSansPro(
        fontSize:   10,
        color:      theme.colorScheme.onBackground,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ).copyWith(
        fontFamilyFallback: [
          'NotoSansJP',
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape:   BoxShape.circle,
          border:  Border.all(width : 1, color: iconColor),
        ),
        child: IconButton(
          icon: Icon(
            iconData,
            color: iconColor,
            size: 35,
          ),
          iconSize: 45,
          onPressed: () async{
            if (url != null) {
              html.window.open(url!, 'new tab');
            }
          },
        ),
      ),
    );
  }
}

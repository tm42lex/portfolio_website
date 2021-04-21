import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;
import 'package:portfolio_website/responsive_breakpoints.dart' as rb;

class IconOverlay extends StatefulWidget {
  @required final String    githubUrl;
  @required final String    appStoreUrl;
  @required final String    googlePlayUrl;
  @required final ThemeData theme;
  IconOverlay({this.githubUrl, this.appStoreUrl, this.googlePlayUrl, this.theme, Key key})  : super(key : key);

  final Duration fixedDuration = const Duration(milliseconds: 420);
  @override
  _IconOverlay createState()=>  _IconOverlay();
}

class _IconOverlay extends State<IconOverlay>  {

  bool    enableAppStore;
  bool    enableGooglePlay;
  bool    enableGithub;
  double  screenOpacity;

  @override
  void initState() {
    super.initState();
    enableAppStore    = (widget.appStoreUrl   != null);
    enableGooglePlay = (widget.googlePlayUrl != null);
    enableGithub      = (widget.githubUrl     != null);
    screenOpacity     = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    var width         = MediaQuery.of(context).size.width;
    var isSmallScreen = (rb.isSmartphoneWidth(width) || rb.isTabletWidth_Small(width));
    return Material(
      color: widget.theme.backgroundColor.withOpacity(screenOpacity),
      child: InkWell(
        onTap: () {
          return ;
        },
        onHover: (isHovering) {
          if(isHovering) {
            setState(() {
              screenOpacity = .75;
            });
          } else {
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
                  iconColor:  enableGithub ? widget.theme.canvasColor : widget.theme.canvasColor.withOpacity(.2),
                  url:        widget.githubUrl,
                  message:    enableGithub ? paragraph.githubIconMessage : paragraph.comingSoon,
                ),
                _Icon(
                  iconData:   FontAwesomeIcons.appStore,
                  iconColor:  enableAppStore ? widget.theme.canvasColor : widget.theme.canvasColor.withOpacity(.2),
                  url:        widget.appStoreUrl,
                  message:    enableAppStore ? paragraph.appStoreIconMessage : paragraph.comingSoon,
                ),
                _Icon(
                  iconData:   FontAwesomeIcons.googlePlay,
                  iconColor:  enableGooglePlay ? widget.theme.canvasColor : widget.theme.canvasColor.withOpacity(.2),
                  url:        widget.googlePlayUrl,
                  message:    enableGooglePlay ? paragraph.googlePlayIconMessage : paragraph.comingSoon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  @required final IconData iconData;
  @required final Color    iconColor;
  @required final String   url;
  @required final String   message;
  const _Icon({this.iconData, this.url, this.iconColor, this.message,  Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return  Tooltip(
      message: message,
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
              await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
          },
        ),
      ),
    );
  }
}
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;

class SNSIcons extends StatelessWidget {
  @required final ThemeData theme;
  const SNSIcons({this.theme, Key key}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 200,
     height: 60,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         _SNSIcon(
           theme:             theme,
           message:           paragraph.emailIconMessage,
           icon:              FontAwesomeIcons.envelope,
           onPressedAction:   _sendEmail,
         ),
         _SNSIcon(
           theme:             theme,
           message:           paragraph.githubIconMessage,
           icon:              FontAwesomeIcons.github,
           onPressedAction:   _moveToGitHub,
         ),
       ],
     ),
   );
  }
  void _sendEmail() {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path:   paragraph.emailAddress,
    );
    launch(_emailLaunchUri.toString());
  }

  void _moveToGitHub() {
    final _url = paragraph.githubURL;
    _launchURL(_url);
  }

  void _launchURL(String _url) async{
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}

class _SNSIcon extends StatelessWidget {
  @required final ThemeData theme;
  @required final IconData  icon;
  @required final String    message;
  @required final Function  onPressedAction;
  const _SNSIcon({this.theme, this.icon, this.message, this.onPressedAction, Key key}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: IconButton(
        icon: Icon(icon, color: theme.accentColor.withOpacity(.75), size: 42,),
        iconSize: 42,
        onPressed: () {
          onPressedAction();
        },
      ),
    );
  }
}
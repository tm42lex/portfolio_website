import 'dart:core';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/paragraph.dart' as paragraph;

class SNSIcons extends StatelessWidget {
  final ThemeData theme;
  const SNSIcons({required this.theme, Key ? key}) : super(key : key);
  
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
  Future<void> _sendEmail() async{
    final data = ClipboardData(text: paragraph.emailAddress);
    await Clipboard.setData(data);
  }

  void _moveToGitHub() {
    final _url = paragraph.githubURL;
    _launchURL(_url);
  }

  void _launchURL(String _url) async{
    html.window.open(_url, 'new tab');
  }
}

class _SNSIcon extends StatelessWidget {
  final ThemeData theme;
  final IconData  icon;
  final String    message;
  final Function  onPressedAction;
  const _SNSIcon({required this.theme, required this.icon, required this.message,
    required this.onPressedAction, Key ? key}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
      ),
      textStyle: GoogleFonts.sourceSansPro(
        fontSize:   10,
        color:      theme.colorScheme.onSecondary,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ).copyWith(
        fontFamilyFallback: [
          'NotoSansJP',
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: theme.colorScheme.secondary, size: 42,),
        iconSize: 42,
        onPressed: () {
          onPressedAction();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  @required final String     title;
  @required final String     introSentence;
  @required final bool       isSmallFont;
  @required final ThemeData  theme;
  @required final double     width;
  const CardText({this.title, this.introSentence, this.theme, this.isSmallFont,this.width,  Key  key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    return  Container(
      width: width,
      height: 250,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height / 2 / 15,),
          SelectableText(
            title,
            style: TextStyle(
              fontSize:   (isSmallFont) ? 20 : 30,
              color:      theme.colorScheme.primary,
              decoration: TextDecoration.none,
              fontWeight: (isSmallFont) ? FontWeight.w300 : FontWeight.w400,
            ),
          ),
          SizedBox(height: height / 2 / 15,),
          Expanded(
            child: SelectableText(
              introSentence,
              style: TextStyle(
                fontSize:   (isSmallFont) ? 15 : 20,
                color:      theme.colorScheme.onBackground,
                decoration: TextDecoration.none,
                fontWeight: (isSmallFont) ? FontWeight.w200 : FontWeight.w300,
              ),
              // maxLines: 4,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

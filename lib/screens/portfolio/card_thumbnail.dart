import 'package:flutter/material.dart';

class CardThumbnail extends StatelessWidget {
  @required final String imagePath;
  @required final bool   isSmallScreen;
  const CardThumbnail({this.imagePath, this.isSmallScreen, Key  key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
   return  Container(
      height:   150,
      width:   150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
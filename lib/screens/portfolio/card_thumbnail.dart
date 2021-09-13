import 'package:flutter/material.dart';

class CardThumbnail extends StatelessWidget {
  final String imagePath;
  const CardThumbnail({required this.imagePath,  Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
   return  Container(
      height:   150,
      width:   150,
      child : CircleAvatar(radius: 20, backgroundImage: NetworkImage('assets/$imagePath')),
    );
  }
}

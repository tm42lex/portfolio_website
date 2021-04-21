import 'package:flutter/material.dart';

class SelfieContainer extends StatelessWidget {
  const SelfieContainer({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 270,
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.luminosity,
        color: Colors.deepOrange,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/selfie.jpg"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
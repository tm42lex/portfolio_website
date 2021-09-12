import 'package:flutter/material.dart';

class SelfieContainer extends StatelessWidget {
  const SelfieContainer({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 270,
      child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('assets/images/selfie.jpg')
      ),
    );
  }
}

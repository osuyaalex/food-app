import 'package:flutter/material.dart';

class TitleSpace extends StatelessWidget {
  final String Title;
  const TitleSpace(this.Title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      Title,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Fontie'),
    );
  }
}

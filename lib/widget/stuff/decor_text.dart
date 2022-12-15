// ignore: file_names
import 'package:flutter/material.dart';

class DecorationText extends StatelessWidget {
  final String TitleStuff;
  const DecorationText(this.TitleStuff,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0,), borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2.5),
        child:Text(TitleStuff),),);
  }
}

import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price ;
  const PriceTag(this.price, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5.0),


        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
          child: Text(
            '\$$price',
            style: TextStyle(color: Colors.white),
          ),

        ));
  }
}

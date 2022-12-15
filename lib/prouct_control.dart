import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {


  final Function updateProduct;

  ProductControl(this.updateProduct);
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
    onPressed: () {
      updateProduct({'title': 'chocolate', 'image': 'images/images (2).jpeg'});

    },

    child: Text("Add Product"),

    );
  }
}

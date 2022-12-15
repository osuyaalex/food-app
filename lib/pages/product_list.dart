import 'package:flutter/material.dart';
import 'package:flutter_yes/pages/product_create.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> stuff;
  final Function addProduct;
  final Function updateProduct;



  const ProductList(
    this.stuff,this.addProduct, this.updateProduct, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(stuff[index]['image']),
          title: Text(stuff[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){                           //this is the original way of navigating to a page.. dont forget
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return ProductCreate(stuff: stuff, addProduct: addProduct, updateProduct: updateProduct ,);
                })
              );
            },
          ),
        );
      },
      itemCount: stuff.length,
    );
  }
}

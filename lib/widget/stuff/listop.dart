import 'package:flutter/material.dart';
import 'package:flutter_yes/pages/product.dart';
import 'package:flutter_yes/widget/stuff/decor_text.dart';
import 'package:flutter_yes/widget/stuff/price_tag.dart';
import 'package:flutter_yes/widget/stuff/title_space.dart';

class ProductCards extends StatelessWidget {
  final List<Map<String, dynamic>> stuff;

  ProductCards({required this.stuff});

  Widget buildProduct(BuildContext context, {required int index}) {
    print(this.stuff);
    return Card(
      child: Column(
        children: [
          Image.asset(stuff[index]['image']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSpace(stuff[index]['title'],),

                   PriceTag(stuff[index]['price'].toString()),

              ],
            ),
          ),
          DecorationText('Lagos City Polytechnic'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(                                               //formerly was a textbutton
                     icon: Icon(Icons.info),
                      color: Theme.of(context).colorScheme.secondary,

                      onPressed: () => Navigator.pushNamed<bool>(
                          context, '/product/' + index.toString())),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.favorite_border),
                    color: Colors.red,

                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget productIf = Center(
      child: Text("Add New Product"),
    );
    if (stuff.length > 0) {
      productIf = ListView.builder(
        itemBuilder: (context, index) {
          return buildProduct(context, index: index);
        },
        itemCount: stuff.length,
      );
    }
    return productIf;
  }
}

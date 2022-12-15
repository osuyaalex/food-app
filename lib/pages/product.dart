import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {


  final String name;
  final String imageURL;
  final double price;
  final String description;


  ProductPage(this.name, this.imageURL, this.price,this.description);
  showWarningDialogue(BuildContext context){
    showDialog(context: context, builder:(BuildContext context) {
      return AlertDialog(title: Text('Are you sure?'),
        content: Text('This action cnnot be reversed'),
        actions: [TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Discard')),
          TextButton(onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context, true);
          }, child: Text('Continue'))],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      onWillPop: () {
        print("Back button pressed");

        Navigator.pop(context, false);
        return Future.value(true);

      },

      child: Scaffold(
        appBar: AppBar(
          title:  Text(name),
        ),
        body: Center(
          child: Column(

            children: [


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imageURL),
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                           description,
                 style: TextStyle(
                 fontSize: 20,
                       fontWeight: FontWeight.w200,
                       fontFamily: 'Fontie')
                       ),
                     ),




                   ],
                 ),

              ElevatedButton(onPressed: () => showWarningDialogue(context),
                  child: Text("Delete"))
            ],
          ),
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_yes/auth.dart';
import 'package:flutter_yes/pages/home.dart';
import 'package:flutter_yes/pages/product.dart';
import 'package:flutter_yes/pages/product_admin.dart';
import 'package:flutter_yes/pages/product_create.dart';
//import 'package:flutter/rendering.dart';


void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  List<Map<String,dynamic>> _stuff = [] ;


  void _addProduct(Map<String,dynamic> product) {
    setState(() {
      _stuff.add(product);
    });
    print(_stuff);

  }
  void _updateProduct(int index, Map<String,dynamic> product) {
    setState(() {
      _stuff[index] = product;
    });
    print(_stuff);

  }


  void _deleteProduct(int index) {
    setState(() {
      _stuff.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
        //fontFamily: 'Fontie'

      ),
      home: const AuthPage(),
      routes: {
        'home': (BuildContext context) =>
            HomePage(_stuff),
        'admin':(BuildContext context) =>
            ProductAdminPage(_addProduct, _deleteProduct, _stuff, _updateProduct,  ),

      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name!.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
        return  MaterialPageRoute<bool>(
        builder:(BuildContext context) => ProductPage(_stuff[index]['title'], _stuff[index]['image'], _stuff[index]['price'], _stuff[index]['description']) ,
        );


        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context) =>
            HomePage(_stuff));
      },
    );

  }
}


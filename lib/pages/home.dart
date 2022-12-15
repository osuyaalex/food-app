import 'package:flutter/material.dart';

import '../widget/stuff/listop.dart';


class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> stuff;

const HomePage(this.stuff, {Key? key}) : super(key: key);

Widget _buildDrawer(BuildContext context){
  return  Drawer(child: Column(children:[
    AppBar(
      automaticallyImplyLeading: false,
      title: Text("Choose"),),
    ListTile(
      leading: Icon(Icons.edit),
      title: Text("Manage Products"), onTap:() {
      Navigator.pushReplacementNamed(
          context,
          'admin'
      );
    },)

  ],),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        title: const Text("Another One"),
        actions: [
          IconButton(onPressed:(){},
              icon: Icon(Icons.favorite)
          )
        ],
      ),
      body:  ProductCards(stuff: stuff),
    );
  }
}

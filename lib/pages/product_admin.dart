import 'package:flutter/material.dart';
import 'package:flutter_yes/pages/home.dart';
import 'package:flutter_yes/pages/product_create.dart';
import 'package:flutter_yes/pages/product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;

  final List<Map<String, dynamic>> stuff;
  ProductAdminPage(this.addProduct, this.deleteProduct, this.stuff, this.updateProduct);

  Widget _buildDrawer(BuildContext context){
    return Drawer(child: Column(children:[
      AppBar(
        automaticallyImplyLeading: false,
        title: Text("Choose"),),
      ListTile(
        leading: Icon(Icons.shop),
        title: Text("All Products"), onTap:() {
        Navigator.pushReplacementNamed(context,
            'home'
        );
      },)
    ],),);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:  _buildDrawer(context),
        appBar: AppBar(
          title: const Text("Manage Products"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.create),
              text: "create product",),
            Tab(
              icon: Icon(Icons.list),
              text: "my products",)
          ],),
        ),
        body: TabBarView(children: [
          ProductCreate( addProduct: addProduct, updateProduct: updateProduct, stuff: stuff, ),
          ProductList(stuff, addProduct, updateProduct, )
        ])

      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final List<Map<String, dynamic>> stuff;


  ProductCreate(
      {required this.addProduct,
      required this.stuff,
      required this.updateProduct});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final Map<String, dynamic> formData = {

    'title': '',
    'description': '',
    'price': 0.0,
    'image': 'images/images (2).jpeg'
    // use one or the other
  };




  // String titleValue = "";
  // String descriptionValue = "";
  // double priceValue = 0.0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextFormField(
        //initialValue: widget.stuff[0]['title'],
        decoration: InputDecoration(
          labelText: 'Product Title',
        ),
        // autovalidateMode: AutovalidateMode.always,
        validator: (String? value) {
          //if (value!.length <= 0){      // use one or the other

          if (value!.isEmpty || value.length < 5) {
            //   (||) means or
            return 'Title is required and should be 5+ characters';
          }
        },

        onSaved: (String? value) {
          setState(() {
            formData['title'] = value!;
            // titleValue = value!;
          });
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),


        maxLines: 4,
        validator: (String? value) {
          //if (value!.length <= 0){      // use one or the other
          if (value!.isEmpty || value.length < 10) {
            //   (||) means or
            return 'Description is required and should be 10+ characters';
          }
        },
        onSaved: (String? value) {
          setState(() {
            formData['description'] = value!;
            // descriptionValue = value!;
          });
        },
      ),
    );
  }

  Widget _buildPriceTextField() {
    print(widget.stuff);
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextFormField(
        //initialValue: widget.stuff[0]['price'].toString(),
        decoration: const InputDecoration(
          labelText: 'Price',
        ),
        initialValue:widget.stuff ==null ? '' : widget.stuff['price'].toString(),
        keyboardType: TextInputType.number,
        validator: (String? value) {
          //if (value!.length <= 0){      // use one or the other

          if (value!.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            // essentially the RegExp() means it should be a number
            return 'Price is required and should be a number';
          }
        },
        onSaved: (String? value) {
          setState(() {
            formData['price'] = double.parse(value!);
            // priceValue= double.parse(value!);
          });
        },
      ),
    );
  }

  void _submitForm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    formKey.currentState!.save();

      widget.addProduct(formData);

    // final Map<String, dynamic> product = {
    //   'title':titleValue,
    //   'description' : descriptionValue,
    //   'price': priceValue,
    //   'image' : 'images/images (2).jpeg'
    //
    // };

    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetpadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); // this simply handles the keyboard(if we clear this code, for instance, wee would notice that the keyboard wouldn't be able to close)
      },
      child: Container(
        width: targetWidth,
        child: Form(
          key: formKey,
          child: ListView(
            // we cant do this the normal wat (like we did in auth.dart) because listview does not allow it
            padding: EdgeInsets.symmetric(horizontal: targetpadding / 2),
            children: [
              _buildTitleTextField(),

              Center(child: Text(formData['title'])),

              _buildDescriptionTextField(),

              _buildPriceTextField(),

              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: _submitForm, child: Text('Submit'))

              // GestureDetector(           //this can be used if we're tryna use a custom made button
              //  onTap: _submitForm ,
              //  child: Padding(
              //  padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //  color: Colors.red,
              //  child: Text('Button'),
              //   ),
              //  ),
              // )
            ],
          ),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: pageContent,
    );
  }
}

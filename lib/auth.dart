import 'package:flutter/material.dart';
import 'package:flutter_yes/pages/home.dart';

class AuthPage extends StatefulWidget {

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String EmailValue = '';
  String PasswordValue = '';
  bool AcceptTerms = false;

  DecorationImage _buildBoxDecForBgImage(){               //Decorationimage, like string and void, is a also a type
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('images/download (4).jpeg'),
    );
  }
  Widget _buildEmailTextField(){
    return TextField(
      decoration: const InputDecoration(labelText: 'Email', filled: true, fillColor: Colors.white),
      onChanged: (String Value) {
        setState(() {
          EmailValue = Value;
        });
      },
    );
  }
  Widget _buildPasswordTextField(){
    return TextField(
      decoration: InputDecoration(labelText: 'PassWord', filled: true, fillColor: Colors.white),
      onChanged: (String Value) {
        setState(() {
          PasswordValue = Value;
        });
      },
    );
  }
  Widget _buildSwitchTiles(){
    return SwitchListTile(
      value: AcceptTerms,
      onChanged: (bool value) {
        setState(() {
          AcceptTerms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }
  void _submitForm(){
     print(EmailValue);
    print(PasswordValue);

    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth =  MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 768.0 ? 500.0 : deviceWidth * 0.95;   // this basically means that if the devicewidth is greater (>) than 768 then (?) set it to 500 otherwise (:) multiply device width by 0.95 ( 95% of the available width)
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBoxDecForBgImage()
          ),
          child: Center(

            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(                                                    //listview was uesd before, singlechildscrollview is used in this case because we  want the textfields to be at the centre. list view cannot make that happen
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  _buildEmailTextField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildPasswordTextField()
                  ),
                  _buildSwitchTiles(),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: _submitForm,
                      child: Text("Login")),
                ],
            ),
              ),
          ),
          )
        ),);
  }
}

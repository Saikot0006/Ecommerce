import 'package:eomerence_app/auth/firebase_authentication.dart';
import 'package:eomerence_app/pages/product_list_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errMsg='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: (){
              final String email = "a@gmail.com";
              final String password = "123456";

              FirebaseAuthentication.loginUser(email, password).then((user) => {
                if(user!=null){
                  Navigator.pushNamed(context, ProductListPage.routeName),
                }
              }).catchError((error){
                errMsg = error.message;
              });
            }, child: Text("Login")),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(errMsg),
            ),
          ],
        ),
      ),
    );
  }
}

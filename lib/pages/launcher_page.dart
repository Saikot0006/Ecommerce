import 'package:eomerence_app/auth/firebase_authentication.dart';
import 'package:eomerence_app/pages/login_page.dart';
import 'package:eomerence_app/pages/product_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static final String routeName = "/launcher";
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      FirebaseAuthentication.currentUser == null ?
          Navigator.pushReplacementNamed(context, LoginPage.routeName) :
          Navigator.pushReplacementNamed(context, ProductListPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

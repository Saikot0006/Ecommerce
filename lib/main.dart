import 'package:eomerence_app/pages/launcher_page.dart';
import 'package:eomerence_app/pages/login_page.dart';
import 'package:eomerence_app/pages/new_product_page.dart';
import 'package:eomerence_app/pages/product_details_pages.dart';
import 'package:eomerence_app/pages/product_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LauncherPage(),
      routes: {
        LauncherPage.routeName : (context) => LauncherPage(),
        LoginPage.routeName : (context) => LoginPage(),
        ProductListPage.routeName : (context) => ProductListPage(),
        NewProductPage.routeName : (context) => NewProductPage(),
        ProductDetailsPages.routeName : (context) => ProductDetailsPages(),


      },
    );
  }
}
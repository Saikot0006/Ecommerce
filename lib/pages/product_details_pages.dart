import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eomerence_app/db/db_helper.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPages extends StatefulWidget {
  static final String routeName = "/product_details";
  @override
  _ProductDetailsPagesState createState() => _ProductDetailsPagesState();
}

class _ProductDetailsPagesState extends State<ProductDetailsPages> {
  String id;
  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: DBHelper.getAllProductById(id),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final ProductModel productModel = ProductModel.fromMap(snapshot.data.data());
              return Column(
                children: [
                  Hero(tag: productModel.id,child: Image.file(File(productModel.localImage),height: 400,width: double.maxFinite,)),
                ],
              );
            }
            if(snapshot.hasError){
              return Text("Failed to fetch data");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

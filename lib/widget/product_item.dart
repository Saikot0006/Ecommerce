import 'dart:ffi';
import 'dart:io';

import 'package:eomerence_app/model/product_model.dart';
import 'package:eomerence_app/pages/product_details_pages.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ProductModel productModel;

  ProductItem(this.productModel);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetailsPages.routeName,arguments: widget.productModel.id),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              Expanded(child: Hero(tag: widget.productModel.id,child: Image.file(File(widget.productModel.localImage),height: 150,width: double.maxFinite,fit: BoxFit.cover,))),
              Text(widget.productModel.name,style: TextStyle(
                fontSize: 16,
              ),),
              Text("BDT ${widget.productModel.price}"),
            ],
          ),
        ),
      ),
    );
  }
}

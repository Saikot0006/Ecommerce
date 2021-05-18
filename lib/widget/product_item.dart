import 'dart:io';

import 'package:eomerence_app/db/db_helper.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:eomerence_app/pages/product_details_pages.dart';
import 'package:eomerence_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              Expanded(child: Hero(
                  tag: widget.productModel.id,
                  child: Image.file(File(widget.productModel.localImage),height: 150,width: double.maxFinite,fit: BoxFit.cover,))),
              Text(widget.productModel.name,style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),),
              Text("BDT ${widget.productModel.price}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<CartProvider>(
                    builder:(context, cartProvider, _) => IconButton(
                        icon: Icon(cartProvider.isInCart(widget.productModel.id) ? Icons.done : Icons.add_shopping_cart_outlined),
                        onPressed: cartProvider.isInCart(widget.productModel.id) ? null : () {
                          cartProvider.addToCart(widget.productModel);
                        }),
                  ),
                  IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: _deleteProduct)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _deleteProduct() {

    showDialog(barrierDismissible: false, context: context, builder: (context) => AlertDialog(
      title: Text('Delete ${widget.productModel.name}?'),
      content: Text('Are you sure to delete this item?'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('NO',style: TextStyle(color: Colors.grey),)),
        ElevatedButton(onPressed: (){
          DBHelper.deleteProduct(widget.productModel.id).then((value) => {
            Navigator.pop(context),
          });
        }, child: Text('YES')),
      ],
    ));
  }
}

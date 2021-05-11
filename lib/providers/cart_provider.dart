import 'package:eomerence_app/model/caart_model.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<CartModel> cartList = [];

  addToCart(ProductModel productModel){
    cartList.add(CartModel(productId: productModel.id,productName: productModel.name,price: productModel.price));
    notifyListeners();
    print(cartList.length);
  }

  int get totalCartItems => cartList.length;

  bool isInCart(String id){
    bool tag = false;
    for(var model in cartList){
      if(model.productId == id){
        tag = true;
        break;
      }
    }
    return tag;
  }

}
import 'package:eomerence_app/model/cart_model.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:eomerence_app/utils/product_utils.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<CartModel> cartList = [];

  addToCart(ProductModel productModel){
    cartList.add(CartModel(productId: productModel.id,productName: productModel.name,price: productModel.price));
    notifyListeners();
    print(cartList.length);
  }

  int get totalCartItems => cartList.length;

  int get grandTotal{
    var total = 0;
    cartList.forEach((model) {
      total += model.price * model.qty;
    });
    return total;
  }

  clearCart(){
    cartList.clear();
    notifyListeners();
  }

  removeSingleCart(CartModel cartModel){
    cartList.remove(cartModel);
    notifyListeners();
  }

  int subTotal(num price,num  qty) => price * qty;

  int get totalPayableAmount => (grandTotal + deliveryCharge) - discount;

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

  increaseQuantity(CartModel cartModel){
    
    var index = cartList.indexOf(cartModel);
    cartList[index].qty++;
    notifyListeners();
  }

  decreaseQuantity(CartModel cartModel){
    var index = cartList.indexOf(cartModel);
    if(cartList[index].qty > 1){
      cartList[index].qty--;
      notifyListeners();
    }

  }

}
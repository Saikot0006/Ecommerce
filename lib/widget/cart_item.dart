import 'package:eomerence_app/model/caart_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {


 // const CartItem({Key key}) : super(key: key);
  final CartModel cartModel;

  CartItem(this.cartModel);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.cartModel.productName),
      subtitle: Text('Quantity: ${widget.cartModel.qty}'),
      trailing: Text('BDT ${widget.cartModel.price * widget.cartModel.qty}'),
    );
  }
}

import 'package:eomerence_app/providers/cart_provider.dart';
import 'package:eomerence_app/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static final String routeName = "/cart";
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartProvider cartProvider;

  @override
  void didChangeDependencies() {
    cartProvider = Provider.of<CartProvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          TextButton(onPressed: (){
            cartProvider.clearCart();
          }, child: Text('CLEAR CART',style: TextStyle(
            color: Colors.white
          ),),),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartProvider.cartList.length,
            itemBuilder: (context,index) => CartItem(cartProvider.cartList[index]),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Grand Total : ${cartProvider.grandTotal}',style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

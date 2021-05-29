import 'package:eomerence_app/model/cart_model.dart';
import 'package:eomerence_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: ListTile(
        trailing: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,size: 40,),
        tileColor: Theme.of(context).backgroundColor,
      ),
      onDismissed: (_){
        Provider.of<CartProvider>(context,listen: false).removeSingleCart(widget.cartModel);
      },
      child: ListTile(
        title: Text(widget.cartModel.productName),
        subtitle: Consumer<CartProvider>(
          builder: (context,cartProvider,_) => Row(
            children: [
              Text('Quantity: ${widget.cartModel.qty}'),
              IconButton(icon: Icon(Icons.remove), onPressed: (){
                cartProvider.decreaseQuantity(widget.cartModel);
              }),
              IconButton(icon: Icon(Icons.add), onPressed: (){
                cartProvider.increaseQuantity(widget.cartModel);
              }),
            ],
          ),
        ),

        trailing: Text('BDT ${widget.cartModel.price * widget.cartModel.qty}'),
      ),
    );
  }
}

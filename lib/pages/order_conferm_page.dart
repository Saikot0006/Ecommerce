import 'package:eomerence_app/model/customer_model.dart';
import 'package:eomerence_app/providers/cart_provider.dart';
import 'package:eomerence_app/utils/product_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderConfirmPage extends StatefulWidget {
  static final String routeName = "/order_confirm";
  const OrderConfirmPage({Key key}) : super(key: key);

  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  CustomerModel customerModel;
  String paymentMethod;
  CartProvider cartProvider = CartProvider();
  @override
  void didChangeDependencies() {
    cartProvider = Provider.of<CartProvider>(context);
    List<dynamic> arg = ModalRoute.of(context).settings.arguments;
    customerModel = arg[0];
    paymentMethod = arg[1];

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),),
      body: Column(
        children: [

          Expanded(child: ListView.builder(
              itemCount: cartProvider.cartList.length,
              itemBuilder: (context,index){
                final model = cartProvider.cartList[index];
                return ListTile(
                  title: Text(model.productName),
                  subtitle: Text('QTY: ${model.qty}'),
                  trailing: Text('Price: ${cartProvider.subTotal(model.price, model.qty)}'));
              } )
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Card(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              elevation: 5,
                child: Column(
                  children: [
                    Text('GRAND TOTAL: ${cartProvider.grandTotal}'),
                    Text('DELIVERY CHARGE: $deliveryCharge'),
                    Text('DISCOUNT: $discount'),
                    Text('PAYMENT METHOD: $paymentMethod'),
                    Divider(color: Colors.white,),
                    Text('TOTAL PAYABLE AMOUNT: ${cartProvider.totalPayableAmount}'),
                    ElevatedButton(onPressed: _confirmOrder, child: Text('Confirm Order'))

                  ],
                ),
            ),
          )
        ],
      ),
    );
  }

  void _confirmOrder() {

  }
}

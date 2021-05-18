import 'package:eomerence_app/auth/firebase_authentication.dart';
import 'package:eomerence_app/db/db_helper.dart';
import 'package:eomerence_app/model/product_model.dart';
import 'package:eomerence_app/pages/cart_page.dart';
import 'package:eomerence_app/pages/new_product_page.dart';
import 'package:eomerence_app/providers/cart_provider.dart';
import 'package:eomerence_app/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  static final String routeName = "/product_list";
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String errorVerification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          TextButton(onPressed: () => Navigator.pushNamed(context, NewProductPage.routeName),
              child: Text("ADD",style: TextStyle(
                color: Colors.white
              ),)),
          Stack(
            children: [
              IconButton(icon: Icon(Icons.shopping_cart_sharp),
                  onPressed: () => Navigator.pushNamed(context, CartPage.routeName)),
              Positioned(
                right: 5,
                child: Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                  ),
                  child: Consumer<CartProvider>(
                    builder: (context, cartProvider, _) => Text('${cartProvider.totalCartItems}',style: TextStyle(
                      fontSize: 12,color: Colors.white,

                    ),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: DBHelper.getAllProduct(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<ProductModel> productList =
            List.generate(snapshot.data.docs.length, (index) =>
                ProductModel.fromMap(snapshot.data.docs[index].data()));
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              childAspectRatio: 0.7,
              children: productList.map((product) => ProductItem(product)).toList(),
            );
          }
          if(snapshot.hasError){
            return Text("Failed to fetch data");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
}

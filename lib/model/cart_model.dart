
final String CART_MODEL_PRODUCT_ID = 'productId';
final String CART_MODEL_PRODUCT_NAME = 'productName';
final String CART_MODEL_PRODUCT_PRICE = 'price';
final String CART_MODEL_PRODUCT_QTY = 'quantity';

class CartModel{
  String productId;
  String productName;
  num price;
  int qty;


  CartModel(
      {this.productId, this.productName, this.price, this.qty = 1});

  CartModel.fromMap(Map<String,dynamic> map){
    productId = map[CART_MODEL_PRODUCT_ID];
    productName = map[CART_MODEL_PRODUCT_NAME];
    price = map[CART_MODEL_PRODUCT_PRICE];
    qty = map[CART_MODEL_PRODUCT_QTY];
  }

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      CART_MODEL_PRODUCT_ID : productId,
      CART_MODEL_PRODUCT_NAME : productName,
      CART_MODEL_PRODUCT_PRICE : price,
      CART_MODEL_PRODUCT_QTY : qty,
    };
    return map;
  }

  @override
  String toString() {
    return 'CartModel{productId: $productId, productName: $productName, price: $price, qty: $qty }';
  }
}
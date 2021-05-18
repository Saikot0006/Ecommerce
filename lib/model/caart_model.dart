class CartModel{
  String productId;
  String productName;
  num price;
  int qty;


  CartModel(
      {this.productId, this.productName, this.price, this.qty = 1});

  @override
  String toString() {
    return 'CartModel{productId: $productId, productName: $productName, price: $price, qty: $qty }';
  }
}
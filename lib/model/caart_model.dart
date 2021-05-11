class CartModel{
  String productId;
  String productName;
  num price;
  int qty;
  num subTotal;

  CartModel(
      {this.productId, this.productName, this.price, this.qty = 1, this.subTotal});

  @override
  String toString() {
    return 'CartModel{productId: $productId, productName: $productName, price: $price, qty: $qty, subTotal: $subTotal}';
  }
}
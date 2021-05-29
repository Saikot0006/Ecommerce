import 'package:cloud_firestore/cloud_firestore.dart';

final String ORDER_ID = 'orderID';
final String TIMESTAMP = 'timestamp';
final String CUSTOMER_ID = 'customerID';
final String GRAND_TOTAL = 'grandTotal';
final String DISCOUNT = 'discount';
final String DELIVERY_CHARGE = 'deliveryCharge';
final String ORDER_STATUS = 'orderStatus';
final String ORDER_METHOD = 'orderMethod';

class OrderModel{
  String orderID;
  Timestamp timestamp;
  String customerID;
  num grandTotal;
  num discount;
  num deliveryCharge;
  String orderStatus;
  String orderMethod;

  OrderModel(
      {this.orderID,
      this.timestamp,
      this.customerID,
      this.grandTotal,
      this.discount = 0,
      this.deliveryCharge,
      this.orderStatus,
      this.orderMethod});
}
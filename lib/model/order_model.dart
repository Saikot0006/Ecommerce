import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eomerence_app/utils/product_utils.dart';

final String ORDER_ID = 'orderID';
final String TIMESTAMP = 'timestamp';
final String CUSTOMER_ID = 'customerID';
final String GRAND_TOTAL = 'grandTotal';
final String DISCOUNT = 'discount';
final String DELIVERY_CHARGE = 'deliveryCharge';
final String ORDER_STATUS = 'orderStatus';
final String PAYMENT_METHOD = 'paymentMethod';

class OrderModel{
  String orderID;
  Timestamp timestamp;
  String customerID;
  num grandTotal;
  num discount;
  num deliveryCharge;
  String orderStatus;
  String paymentMethod;

  OrderModel(
      {this.orderID,
      this.timestamp,
      this.customerID,
      this.grandTotal,
      this.discount = 0,
      this.deliveryCharge,
      this.orderStatus,
      this.paymentMethod});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      ORDER_ID : orderID,
      TIMESTAMP : timestamp,
      CUSTOMER_ID : customerID,
      GRAND_TOTAL : grandTotal,
      DISCOUNT : discount,
      DELIVERY_CHARGE : deliveryCharge,
      ORDER_STATUS : orderStatus,
      PAYMENT_METHOD : paymentMethod,
    };
    return map;
  }

  @override
  String toString() {
    return 'OrderModel{orderID: $orderID, timestamp: $timestamp, customerID: $customerID, grandTotal: $grandTotal, discount: $discount, deliveryCharge: $deliveryCharge, orderStatus: $orderStatus, paymentMethod: $paymentMethod}';
  }
}
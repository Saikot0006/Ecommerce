import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eomerence_app/model/customer_model.dart';
import 'package:eomerence_app/model/product_model.dart';

final String COLLECTION_NAME = "Products";
final String COLLECTION_CUSTOMER = "Customers";
class DBHelper{
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> insertProduct(ProductModel productModel){
    final doc = _db.collection(COLLECTION_NAME).doc();
    productModel.id = doc.id;
    return doc.set(productModel.toMap());

  }

  static Future<String> insertNewCustomer(CustomerModel customerModel) async {
    final doc = _db.collection(COLLECTION_CUSTOMER).doc();
    customerModel.id = doc.id;
    await doc.set(customerModel.toMap());
    return doc.id;

  }

  static Stream<QuerySnapshot> getAllProduct() => _db.collection(COLLECTION_NAME).snapshots();

  static Stream<DocumentSnapshot> getAllProductById(String id) => _db.collection(COLLECTION_NAME).doc(id).snapshots();

  static Future<void> deleteProduct(String id) => _db.collection(COLLECTION_NAME).doc(id).delete();

  static Future<QuerySnapshot> findCustomerWithPhone(String phone){
    return _db.collection(COLLECTION_CUSTOMER).where(CUSTOMER_PHONE,isEqualTo: phone).get();
  }




}
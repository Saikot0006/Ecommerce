import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eomerence_app/model/product_model.dart';

final String COLLECTION_NAME = "Products";
class DBHelper{
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> insertProduct(ProductModel productModel){
    final doc = _db.collection(COLLECTION_NAME).doc();
    productModel.id = doc.id;
    return doc.set(productModel.toMap());

  }

  static Stream<QuerySnapshot> getAllProduct() => _db.collection(COLLECTION_NAME).snapshots();

  static Stream<DocumentSnapshot> getAllProductById(String id) => _db.collection(COLLECTION_NAME).doc(id).snapshots();

  static Future<void> deleteProduct(String id) => _db.collection(COLLECTION_NAME).doc(id).delete();




}
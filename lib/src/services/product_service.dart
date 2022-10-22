import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_apps/src/dto/product_dto.dart';

class ProductService {
  static Stream<List<ProductDto>> products = FirebaseFirestore.instance
      .collection("product")
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => ProductDto.fromJson(doc.data())).toList());

  //add
  static Future<bool> addProduct(ProductDto productDto) async {
    final products = FirebaseFirestore.instance.collection("product");

    final uid = products.doc().id;
    productDto.id = uid;
    final docRef = products.doc(uid);

    try {
      await docRef.set(productDto.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //update
  static Future<bool> updateProduct(ProductDto productDto) async {
    final products = FirebaseFirestore.instance.collection("product");

    final docRef = products.doc(productDto.id);

    try {
      await docRef.update(productDto.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteProduct(ProductDto productDto) async {
    final products = FirebaseFirestore.instance.collection("product");

    try {
      await products.doc(productDto.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}

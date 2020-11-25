import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom/user/models/product.dart';

class ProductServices {
  String collection = 'products';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

//returning list of products
  Future<List<ProductModel>> getProducts() async =>
      await _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  //can make a function of search here also
}

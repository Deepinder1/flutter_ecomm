import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
}

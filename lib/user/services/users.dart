import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecom/user/models/cart_item.dart';
import 'package:flutter_ecom/user/models/user.dart';

//TODO these all functions in the class may require Future<void>  as the second function so checkit

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(Map data) async {
    await _firestore.collection(collection).doc(data['uid']).set(data);
  }

  Future<UserModel> getUserById(String id) async =>
      await _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addToCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      'cart': FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      'cart': FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}

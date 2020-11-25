import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_item.dart';

class UserModel {
  static const ID = 'uid';
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const STRIPE_ID = 'stripeId';
  static const CART = 'cart';

  //creating feilds
  String _name;
  String _email;
  String _id;
  String _stripeId;
  int _priceSum = 0;

  //getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get stripeId => _stripeId;

  //public variables

  List<CartItemModel> cart;

  int totalCartPrice;

  //customized constructor
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME] ?? 'name';
    _email = snapshot.data()[EMAIL] ?? 'email';
    _id = snapshot.data()[ID] ?? 'uid';
    _stripeId = snapshot.data()[STRIPE_ID] ?? '';

    //passing a list of cartItems but if its null then passing empty list
    //and making a function to add items to that list
    cart = _convertCartItems(snapshot.data()[CART] ?? []);

    //getting the total cart price
    totalCartPrice = snapshot.data()[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data()[CART]);
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    //adding an item in converted cart in this for loop
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  //making a function to get total price
  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }

    for (Map cartItem in cart) {
      _priceSum += cartItem['price'];
    }

    int total = _priceSum;
    return total;
  }
}

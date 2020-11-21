import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/models/cart_item.dart';
import 'package:flutter_ecom/user/models/order.dart';
import 'package:flutter_ecom/user/models/product.dart';
import 'package:flutter_ecom/user/models/user.dart';
import 'package:flutter_ecom/user/services/order.dart';
import 'package:flutter_ecom/user/services/users.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  UserModel _userModel;

  //getters
  UserModel get userModel => _userModel;

  Status get status => _status;

  User get user => _user;

  //public variables
  List<OrderModel> orders = [];

  //constructor
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((_onStateChanged));
  }
// in all these functions we are using enums in _status
//because we ca use in Switch case for changing screens or for doing anything
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print('The error for signIn is: ${e.toString()}');
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        try {
          await _userServices.createUser({
            'name': name,
            'email': email,
            'uid': user.user.uid.toString(),
            'stripeId': '',
          });
          notifyListeners();
        } catch (e) {
          notifyListeners();
          print('The error for Creating user is: ${e.toString()}');
        }
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print('The error for signUp is: ${e.toString()}');
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart(
      {ProductModel product, String size, String color}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        'id': cartItemId,
        'name': product.name,
        'image': product.picture,
        'productId': product.id,
        'price': product.price,
        'size': size,
        'color': color
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);

      print('Cart items are : ${cart.toString()}');
      _userServices.addToCart(userId: _user.uid, cartItem: item);

      return true;
    } catch (e) {
      print('The error for adding from cart is: ${e.toString()}');
      return false;
    }
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print('The product is : ${cartItem.toString()}');

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print('The error for removing from cart is: ${e.toString()}');
      return false;
    }
  }

  //it might return future or streams
  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }
}

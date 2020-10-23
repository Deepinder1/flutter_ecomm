import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/models/product.dart';
import 'package:flutter_ecom/user/services/product.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();

  List<ProductModel> products = [];
  //can make a list of product searched
  // List<ProductModel> productSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const PICTURE = 'picture';
  static const PRICE = 'price';
  static const DESCRIPTION = 'description';
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const QUANTITY = 'quantity';
  static const BRAND = 'brand';
  static const SALE = 'sale';
  static const SIZES = 'sizes';
  static const COLORS = 'colors';

  String _id;
  String _name;
  String _picture;
  String _description;
  String _category;
  String _brand;
  int _quantity;
  double _price;
  bool _sale;
  bool _featured;
  List _colors;
  List _sizes;

  //getters

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  double get price => _price;

  bool get featured => _featured;

  bool get sale => _sale;

  List get colors => _colors;

  List get sizes => _sizes;

//consturctor and Initializing feilds
  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID] ?? '';
    _brand = snapshot.data()[BRAND] ?? '';
    _sale = snapshot.data()[SALE] ?? false;
    _description = snapshot.data()[DESCRIPTION] ?? '';
    _featured = snapshot.data()[FEATURED] ?? false;
    _price = snapshot.data()[PRICE] ?? 0.0;
    _category = snapshot.data()[CATEGORY] ?? '';
    _colors = snapshot.data()[COLORS] ?? [];
    _sizes = snapshot.data()[SIZES] ?? [];
    _name = snapshot.data()[NAME] ?? '';
    _picture = snapshot.data()[PICTURE] ?? '';
  }
  // ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   _id = snapshot.get(ID) ?? '';
  //   _brand = snapshot.get(BRAND) ?? '';
  //   _sale = snapshot.get(SALE) ?? '';
  //   _description = snapshot.get(DESCRIPTION) ?? '';
  //   _featured = snapshot.get(FEATURED) ?? '';
  //   _price = snapshot.get(PRICE) ?? '';
  //   _category = snapshot.get(CATEGORY) ?? '';
  //   _colors = snapshot.get(COLORS) ?? '';
  //   _sizes = snapshot.get(SIZES) ?? '';
  //   _name = snapshot.get(NAME) ?? '';
  //   _picture = snapshot.get(PICTURE) ?? '';
  // }
}

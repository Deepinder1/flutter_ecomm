import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/widgets/custom_text.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

//TODO To make this screen and do written down todos and check the  collections
class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  //Todo make an instance of order services
  @override
  Widget build(BuildContext context) {
    //Todo make final user provider
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Shopping Cart'),
      ),
    );
  }
}

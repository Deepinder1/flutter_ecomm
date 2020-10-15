import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/helpers/style.dart';
import 'package:flutter_ecom/user/widgets/loading.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: yellow,
            size: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Loading()],
          )
        ],
      ),
    );
  }
}

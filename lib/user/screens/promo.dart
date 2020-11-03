import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  const Promo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
            child: Container(
          width: 300,
          height: 100,
          child: Center(
            child: Text(
              'FLAT10%',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
        )),
      ),
    );
  }
}

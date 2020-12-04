import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/provider/user.dart';
import 'package:flutter_ecom/user/screens/order.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await userProvider.getOrders();
            changeScreen(context, OrdersScreen());
          },
          child: Text('See Orders'),
        ),
      ),
    );
  }
}

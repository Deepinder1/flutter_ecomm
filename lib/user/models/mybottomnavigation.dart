import 'package:flutter/material.dart';
import 'package:flutter_ecom/main.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:flutter_ecom/user/helpers/navigations.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  //creating a list of items and icons
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
    TitledNavigationBarItem(
        title: Text('Categories'),
        icon: Icons.dashboard), //TODO add items to catigory page
    TitledNavigationBarItem(title: Text(' Favorite'), icon: Icons.favorite),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  ];

  bool navBarMode = false;
  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(
      onTap: (index) {
        if (index == 0) {
          changeScreenReplacement(context, HomePage());
        }
        print("Selected Index: $index");
      },
      reverse: navBarMode,
      curve: Curves.easeInBack,
      items: items,
      activeColor: Colors.red,
      inactiveColor: Colors.blueGrey,
    );
  }
}

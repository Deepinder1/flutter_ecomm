import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating a list of items and icons
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
    TitledNavigationBarItem(title: Text('Settings'), icon: Icons.settings),
    TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  ];

  bool navBarMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('FashonApp'),
        actions: [
          IconButton(icon: Icon(Icons.power_settings_new), onPressed: () {})
        ],
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) => print("Selected Index: $index"),
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        activeColor: Colors.red,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}

// Start-up logo screen for the app
// Sign in page required (user sign up and business sign up). You need to link database with user sign up and business sign up.
// Once user sign in, home screen.
// 5 icons required at bottom bar of home screen. When click on any icon, will open another page.
// Also require option bar/list for profile page , two other pages, settings and log out option
// Display some images (products) on home screen and when some one click the image, it will open another page describing the product.
// On the product page, there should be a button. When someone click the button, it will popup the promo code and QR code for the product.
// Built-in QR code reader

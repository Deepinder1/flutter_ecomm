import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/models/mybottomnavigation.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
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
    //making a  widget of image_carousel
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/c1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),
        indicatorBgPadding: 5.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('EcomApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new),
            tooltip: 'Log Out',
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60.0,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person_outline),
              ),
            ),
            Divider(
              thickness: 7.0,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help_outline),
              ),
            ),
          ],
        ),
      ),
      //making body
      body: ListView(
        children: <Widget>[
          imageCarousel,
        ],
      ),
      //making bottomNavigationBar
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) {
          print("Selected Index: $index");
        },
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
// Also require option bar/list for profile page , two other pages, dashboard and log out option
// Display some images (products) on home screen and when some one click the image, it will open another page describing the product.
// On the product page, there should be a button. When someone click the button, it will popup the promo code and QR code for the product.
// Built-in QR code reader

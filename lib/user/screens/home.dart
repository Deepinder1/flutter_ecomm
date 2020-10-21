import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating a list of items and icons

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
    );
  }
}

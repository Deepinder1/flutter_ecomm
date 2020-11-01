import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/helpers/style.dart';
import 'package:flutter_ecom/user/provider/product.dart';
import 'package:flutter_ecom/user/provider/user.dart';
import 'package:flutter_ecom/user/screens/login.dart';
import 'package:flutter_ecom/user/screens/product_search.dart';
import 'package:flutter_ecom/user/services/product.dart';
import 'package:flutter_ecom/user/widgets/custom_text.dart';
import 'package:flutter_ecom/user/widgets/featured_products.dart';
import 'package:flutter_ecom/user/widgets/product_card.dart';
import 'package:flutter_ecom/user/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: black),
              accountName: CustomText(
                text: userProvider.userModel?.name ?? "username lading...",
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: userProvider.userModel?.email ?? "email loading...",
                color: white,
              ),
            ),
            ListTile(
              onTap: () async {
                await userProvider.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () async {
                await userProvider.signOut();
                changeScreenReplacement(context, Login());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log out"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  right: 20,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            _key.currentState.openEndDrawer();
                          },
                          child: Icon(Icons.menu))),
                ),
                Positioned(
                  top: 10,
                  right: 60,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            changeScreen(context, CartScreen());
                          },
                          child: Icon(Icons.shopping_cart))),
                ),
                Positioned(
                  top: 10,
                  right: 100,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            _key.currentState.showSnackBar(
                                SnackBar(content: Text("User profile")));
                          },
                          child: Icon(Icons.person))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'What are\nyou Shopping for?',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),

//          Search Text field
//            Search(),

            // Container(
            //   decoration: BoxDecoration(
            //       color: white,
            //       borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(20),
            //           bottomLeft: Radius.circular(20))),
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         top: 8, left: 8, right: 8, bottom: 10),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: grey.withOpacity(0.2),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       child: ListTile(
            //         leading: Icon(
            //           Icons.search,
            //           color: black,
            //         ),
            //         title: TextField(
            //           textInputAction: TextInputAction.search,
            //           onSubmitted: (pattern)async{
            //             await productProvider.search(productName: pattern);
            //             changeScreen(context, ProductSearchScreen());
            //           },
            //           decoration: InputDecoration(
            //             hintText: "blazer, dress...",
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),
            FeaturedProducts(),

//          recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
              ],
            ),

            Column(
              children: productProvider.products
                  .map((item) => GestureDetector(
                        child: ProductCard(
                          product: item,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
//Row(
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//GestureDetector(
//onTap: (){
//key.currentState.openDrawer();
//},
//child: Icon(Icons.menu))
//],
//),

//old HomePage

// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //creating a list of items and icons

//   bool navBarMode = false;
//   @override
//   Widget build(BuildContext context) {
//     //making a  widget of image_carousel
//     Widget imageCarousel = Container(
//       height: 200.0,
//       child: Carousel(
//         boxFit: BoxFit.cover,
//         images: [
//           AssetImage('images/w3.jpeg'),
//           AssetImage('images/m1.jpeg'),
//           AssetImage('images/m2.jpg'),
//           AssetImage('images/w1.jpeg'),
//           AssetImage('images/w4.jpeg'),
//           AssetImage('images/c1.jpg'),
//         ],
//         autoplay: true,
//         animationCurve: Curves.fastOutSlowIn,
//         animationDuration: Duration(microseconds: 1000),
//         indicatorBgPadding: 5.0,
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Text('EcomApp'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.power_settings_new),
//             tooltip: 'Log Out',
//             onPressed: () {},
//           )
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text('User'),
//               accountEmail: Text('user@gmail.com'),
//               currentAccountPicture: GestureDetector(
//                 child: CircleAvatar(
//                   backgroundColor: Colors.black54,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                     size: 60.0,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Home'),
//                 leading: Icon(Icons.home),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Categories'),
//                 leading: Icon(Icons.dashboard),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Favourite'),
//                 leading: Icon(Icons.favorite),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Orders'),
//                 leading: Icon(Icons.shopping_cart),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Profile'),
//                 leading: Icon(Icons.person_outline),
//               ),
//             ),
//             Divider(
//               thickness: 7.0,
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Settings'),
//                 leading: Icon(Icons.settings),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('About'),
//                 leading: Icon(Icons.help_outline),
//               ),
//             ),
//           ],
//         ),
//       ),
//       //making body
//       body: ListView(
//         children: <Widget>[
//           imageCarousel,
//         ],
//       ),
//       //making bottomNavigationBar
//     );
//   }
// }

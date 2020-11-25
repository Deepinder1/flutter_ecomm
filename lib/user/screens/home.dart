// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ecom/user/models/product_model.dart';
// import 'package:flutter_ecom/user/screens/ProductPage.dart';
// import 'package:flutter_ecom/user/screens/cart.dart';
// import 'package:flutter_ecom/user/screens/categories.dart';
// import 'package:flutter_ecom/user/screens/qr_screen.dart';
// import 'package:flutter_ecom/user/widgets/CategoryItem.dart';

// import 'order.dart';

// import 'package:flutter_ecom/user/helpers/navigations.dart';
// import 'package:flutter_ecom/user/helpers/style.dart';
// import 'package:flutter_ecom/user/provider/user.dart';
// import 'package:flutter_ecom/user/screens/login.dart';
// import 'package:flutter_ecom/user/widgets/custom_text.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// //bottom navigation bar
//   PageController _myPage;
//   var selectedPage;

//   @override
//   void initState() {
//     super.initState();
//     _myPage = PageController(initialPage: 1);
//     selectedPage = 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: NeverScrollableScrollPhysics(),
//         controller: _myPage,
//         children: <Widget>[
//           OrdersScreen(),
//           HomePageScreen(),
//           QRViewExample(),
//           CategoriesScreen(),
//           CartScreen(),
//           OrdersScreen(),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.home),
//               color: selectedPage == 1 ? Colors.blue : Colors.grey,
//               onPressed: () {
//                 _myPage.jumpToPage(1);
//                 setState(() {
//                   selectedPage = 1;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.qr_code),
//               color: selectedPage == 2 ? Colors.blue : Colors.grey,
//               onPressed: () {
//                 _myPage.jumpToPage(2);
//                 setState(() {
//                   selectedPage = 2;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.category,
//               ),
//               color: selectedPage == 3 ? Colors.blue : Colors.grey,
//               onPressed: () {
//                 _myPage.jumpToPage(3);
//                 setState(() {
//                   selectedPage = 3;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.shopping_bag_outlined,
//               ),
//               color: selectedPage == 4 ? Colors.blue : Colors.grey,
//               onPressed: () {
//                 _myPage.jumpToPage(4);
//                 setState(() {
//                   selectedPage = 4;
//                 });
//               },
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.shopping_basket_outlined,
//               ),
//               color: selectedPage == 5 ? Colors.blue : Colors.grey,
//               onPressed: () {
//                 _myPage.jumpToPage(5);
//                 setState(() {
//                   selectedPage = 5;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePageScreen extends StatefulWidget {
//   @override
//   _HomePageScreenState createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   //making key
//   final _key = GlobalKey<ScaffoldState>();
// //   ProductServices _productServices = ProductServices();
//   List bannerAdSlider = [
//     'assets/banner1.jpg',
//     'assets/banner2.jpg',
//     'assets/banner3.jpg',
//     'assets/banner4.jpg',
//     'assets/banner5.jpg',
//     'assets/banner6.jpg',
//     'assets/banner7.jpg',
//     'assets/banner8.jpg',
//   ];

//   List<Product> products = [
//     Product(
//         image: 'assets/product1.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'iPad Mini'),
//     Product(
//         image: 'assets/product2.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'iPad Pro'),
//     Product(
//         image: 'assets/product3.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'iPhone Pro Max'),
//     Product(
//         image: 'assets/product4.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Apple Watch 3'),
//     Product(
//         image: 'assets/product5.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Apple Watch 4'),
//     Product(
//         image: 'assets/product6.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Macbook pro 16inch'),
//     Product(
//         image: 'assets/product7.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Macbook Pro'),
//     Product(
//         image: 'assets/product8.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'iMac 4'),
//     Product(
//         image: 'assets/product9.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 't-Shirts'),
//     Product(
//         image: 'assets/product10.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Ethnic Wear - Dresses'),
//     Product(
//         image: 'assets/product11.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 'Dresses'),
//     Product(
//         image: 'assets/product12.jpg',
//         description:
//             'A earum praesentium voluptates nemo fugit. Repudiandae velit ea at et dolorum quisquam eius. Doloremque molestias rerum repellat ad. Et consequatur aspernatur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '100/-',
//         productName: 't-Shirts'),
//     Product(
//         image: 'assets/download.jpeg',
//         description:
//             'This is the demo content  atur sed et magni. Sit maiores officiis quos quibusdam voluptas. Et quis et veniam dolores possimus.',
//         price: '500/-',
//         productName: 'mobiles'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     //providers
//     final userProvider = Provider.of<UserProvider>(context);
//     // final productProvider = Provider.of<ProductProvider>(context);

//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       statusBarBrightness: Brightness.dark,
//       statusBarIconBrightness: Brightness.dark,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));

//     return Scaffold(
//       key: _key,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'E-Com',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         brightness: Brightness.light,
//         elevation: 0,
//         actionsIconTheme: IconThemeData(color: Colors.black),
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {},
//             icon: Icon(EvaIcons.shoppingBagOutline),
//           )
//         ],
//       ),

//       //drawer
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(color: black),
//               currentAccountPicture: CircleAvatar(
//                 child: Icon(
//                   Icons.person,
//                   size: 50,
//                 ),
//                 backgroundColor: white,
//               ),
//               accountName: CustomText(
//                 text: userProvider.userModel?.name ?? "user",
//                 color: white,
//                 weight: FontWeight.bold,
//                 size: 18,
//               ),
//               accountEmail: CustomText(
//                 text: userProvider.userModel?.email ?? " ",
//                 color: white,
//               ),
//             ),
//             ListTile(
//               onTap: () async {
//                 await userProvider.getOrders();
//                 changeScreen(context, OrdersScreen());
//               },
//               leading: Icon(Icons.bookmark_border),
//               title: CustomText(text: "My orders"),
//             ),
//             ListTile(
//               onTap: () async {
//                 await userProvider.getOrders();
//                 changeScreen(context, QRViewExample());
//               },
//               leading: Icon(Icons.qr_code_outlined),
//               title: CustomText(text: "QR code"),
//             ),
//             ListTile(
//               onTap: () async {
//                 await userProvider.signOut();
//                 changeScreenReplacement(context, Login());
//               },
//               leading: Icon(Icons.exit_to_app),
//               title: CustomText(text: "Log out"),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Categories',
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 70,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   children: <Widget>[
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.giftOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFFffa100),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.headphonesOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFF200bfff),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.hardDriveOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFFff91c90),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.printerOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFF9120de),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.videoOffOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFF17e6a9),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.umbrellaOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFFff788e),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: CategoryItem(
//                         icon: EvaIcons.tvOutline,
//                         size: 70,
//                         margin: EdgeInsets.only(
//                           left: 10,
//                         ),
//                         padding: EdgeInsets.all(10),
//                         backgroundColor: Color(0xFFff8176),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 30),

//               //banner ad Slider

//               CarouselSlider(
//                 options: CarouselOptions(
//                   aspectRatio: 16 / 9,
//                   autoPlay: true,
//                 ),
//                 items: bannerAdSlider.map(
//                   (i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image(
//                               image: AssetImage(i),
//                               fit: BoxFit.cover,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ).toList(),
//               ),

//               //banner ad Slider

//               SizedBox(
//                 height: 20,
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Products',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),

//               SizedBox(
//                 height: 20,
//               ),

//               GridView.count(
//                 physics: ClampingScrollPhysics(),
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 childAspectRatio: 1 / 1.25,
//                 children: products.map((product) {
//                   return Stack(
//                     children: <Widget>[
//                       Container(
//                         child: Column(
//                           children: <Widget>[
//                             Hero(
//                               tag: product.image,
//                               child: AspectRatio(
//                                 aspectRatio: 1 / 1,
//                                 child: Image(
//                                   image: AssetImage(product.image),
//                                 ),
//                               ),
//                             ),
//                             Text(product.productName),
//                             Text(
//                               '${product.price}',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.purpleAccent),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ProductPage(
//                                     product: product,
//                                   ),
//                                 ));
//                           },
//                         ),
//                       )
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//expand home page as the project expands with firestore

import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/helpers/style.dart';
import 'package:flutter_ecom/user/provider/product.dart';
import 'package:flutter_ecom/user/provider/user.dart';
import 'package:flutter_ecom/user/screens/login.dart';
import 'package:flutter_ecom/user/screens/qr_screen.dart';
import 'package:flutter_ecom/user/services/product.dart';
import 'package:flutter_ecom/user/widgets/custom_text.dart';
import 'package:flutter_ecom/user/widgets/featured_products.dart';
import 'package:flutter_ecom/user/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'categories.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//bottom navigation bar
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
    selectedPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: <Widget>[
          OrdersScreen(),
          HomePageScreen(),
          QRViewExample(),
          CategoriesScreen(),
          CartScreen(),
          OrdersScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: selectedPage == 1 ? Colors.blue : Colors.grey,
              onPressed: () {
                _myPage.jumpToPage(1);
                setState(() {
                  selectedPage = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.qr_code),
              color: selectedPage == 2 ? Colors.blue : Colors.grey,
              onPressed: () {
                _myPage.jumpToPage(2);
                setState(() {
                  selectedPage = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.category,
              ),
              color: selectedPage == 3 ? Colors.blue : Colors.grey,
              onPressed: () {
                _myPage.jumpToPage(3);
                setState(() {
                  selectedPage = 3;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              color: selectedPage == 4 ? Colors.blue : Colors.grey,
              onPressed: () {
                _myPage.jumpToPage(4);
                setState(() {
                  selectedPage = 4;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_basket_outlined,
              ),
              color: selectedPage == 5 ? Colors.blue : Colors.grey,
              onPressed: () {
                _myPage.jumpToPage(5);
                setState(() {
                  selectedPage = 5;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
            // Row(
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.all(14.0),
            //       child: Container(
            //           alignment: Alignment.centerLeft,
            //           child: new Text('Recent products')),
            //     ),
            //   ],
            // ),

            // Column(
            //   children: productProvider.products
            //       .map((item) => GestureDetector(
            //             child: ProductCard(
            //               product: item,
            //             ),
            //           ))
            //       .toList(),
            // ),
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

// old HomePage

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecom/business/screens/admin.dart';
import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/models/product.dart';
import 'package:flutter_ecom/user/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: ScreensController(),
    ),
  );
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //TODO Add splash screen with logic
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                changeScreen(context, Admin());
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Business Login".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),
            SizedBox(height: 50),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                changeScreen(context, HomePage());
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("User Login".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
    // return HomePage();
  }
}
//TODO Refactor code as much possible

// Start-up logo screen for the app
// Sign in page required (user sign up and business sign up). You need to link database with user sign up and business sign up.
// Once user sign in, home screen.
// 5 icons required at bottom bar of home screen. When click on any icon, will open another page.
// Also require option bar/list for profile page , two other pages, dashboard and log out option
// Display some images (products) on home screen and when some one click the image, it will open another page describing the product.
// On the product page, there should be a button. When someone click the button, it will popup the promo code and QR code for the product.
// Built-in QR code reader

//testing google signin
// creating a global variable
// final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
// class GoogleSignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FlatButton(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'SignIn with google',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30.0,
//                 ),
//               ),
//             ),
//             onPressed: _signInWithGoogle,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     );
//   }

//   _signInWithGoogle() async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

//     final User user =
//         (await firebaseAuth.signInWithCredential(credential)).user;
//   }
// }

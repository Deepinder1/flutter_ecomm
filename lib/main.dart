import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecom/business/providers/app_states.dart';
import 'package:flutter_ecom/business/providers/products_provider.dart';
import 'package:flutter_ecom/business/screens/admin.dart';
import 'package:flutter_ecom/business/screens/signup.dart';
import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/helpers/style.dart';
import 'package:flutter_ecom/user/provider/app.dart';
import 'package:flutter_ecom/user/provider/product.dart';
import 'package:flutter_ecom/user/provider/user.dart';
import 'package:flutter_ecom/user/screens/home.dart';
import 'package:flutter_ecom/user/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: AppState()),
        ChangeNotifierProvider.value(value: AdminProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: cyan),
        home: IntroScreen1(),
      ),
    ),
  );
}

class IntroScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan,
      body: Center(
        child: RaisedButton(
          splashColor: cyan,
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          autofocus: true,
          color: white,
          child: Text('Get Started'.toUpperCase()),
          onPressed: () => changeScreen(context, ScreensController()),
        ),
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/nidus.jpg",
                width: 280.0,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              padding: EdgeInsets.all(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber)),
              onPressed: () {
                changeScreen(context, AdminScreenController());
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Business".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),
            SizedBox(height: 50),
            RaisedButton(
              padding: EdgeInsets.all(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                changeScreenReplacement(context, UserScreenController());
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("User".toUpperCase(), style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
      navigateAfterSeconds: result != null ? Admin() : AdminSignUp(),
      seconds: 1,
      title: new Text(
        'Welcome The Business Admin!',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("business"),
      loaderColor: Colors.red,
    );
  }
}

class UserScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        // return SignUp();
        return Login();
      case Status.Unauthenticated:
      case Status.Authenticating:
        // return SignUp();
        return Login();
      case Status.Authenticated:
        return HomePage();
      default:
        // return SignUp();
        return Login();
    }
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

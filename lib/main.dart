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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My App',
              style: TextStyle(
                  fontSize: 25.0, fontWeight: FontWeight.bold, color: white),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.0),
                  side: BorderSide(color: black)),
              splashColor: cyan,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
              autofocus: true,
              color: white,
              child: Text('Get Started'),
              onPressed: () => changeScreen(context, IntroScreen2()),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/second_page.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                splashColor: cyan,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90.0),
                autofocus: false,
                color: green,
                child: Text('Male'.toUpperCase()),
                onPressed: () => changeScreen(context, IntroScreen3()),
              ),
              RaisedButton(
                splashColor: cyan,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90.0),
                autofocus: true,
                color: white,
                child: Text('Female'.toUpperCase()),
                onPressed: () => changeScreen(context, IntroScreen3()),
              ),
              RaisedButton(
                splashColor: cyan,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90.0),
                autofocus: true,
                color: yellow,
                child: Text('Other'.toUpperCase()),
                onPressed: () => changeScreen(context, IntroScreen3()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IntroScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/third_page.jpg',
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you a Business Owner?',
                style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold, color: white),
              ),
              RaisedButton(
                splashColor: cyan,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                autofocus: true,
                color: white,
                child: Text('Yes'.toUpperCase()),
                onPressed: () => changeScreen(context, AdminScreenController()),
              ),
              RaisedButton(
                splashColor: cyan,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                autofocus: true,
                color: yellow,
                child: Text('No'.toUpperCase()),
                onPressed: () => changeScreen(context, ScreensController()),
              ),
            ],
          )
        ],
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/ecommerce.jpg",
                width: 350.0,
                height: 400.0,
              ),
            ),
            SizedBox(height: 5),
            RaisedButton(
              padding: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: black)),
              onPressed: () {
                changeScreenReplacement(context, UserScreenController());
              },
              color: black,
              textColor: Colors.white,
              child: Text("User".toUpperCase(),
                  style: TextStyle(fontSize: 14, color: white)),
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

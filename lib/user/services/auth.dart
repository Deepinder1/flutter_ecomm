import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<UserCredential> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> googleSignIn() async {
    // TODO: implement googleSignIn
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    try {
      UserCredential user =
          await _firebaseAuth.signInWithCredential(credential);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

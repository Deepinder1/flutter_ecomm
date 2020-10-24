import 'package:flutter/material.dart';
import 'package:flutter_ecom/user/helpers/navigations.dart';
import 'package:flutter_ecom/user/helpers/style.dart';
import 'package:flutter_ecom/user/provider/user.dart';
import 'package:flutter_ecom/user/screens/home.dart';
import 'package:flutter_ecom/user/widgets/loading.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //creating keys fot form and state of scafold
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    //provider

    //TODO see if listen : false have to be set in this provider
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      // TODO instead of Loading put Splash() screen also
      body: user.status == Status.Authenticating
          ? Loading()
          : Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[350],
                              blurRadius: 20.0 //has effect of softening shadow
                              )
                        ]),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            //here can put LOGO
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.shopping_cart,
                                size: 50,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          //name
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                      hintText: 'Fullname',
                                      icon: Icon(Icons.person_outline),
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'The name cannot be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //email
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(Icons.alternate_email),
                                        border: InputBorder.none),
                                    //TODO See if this validator doesn't work then put the pattern out of if block
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value))
                                          return 'Please make sure your email address is valid';
                                        else
                                          return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //password
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _password,
                                    obscureText: hidePass,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The password field cannot be empty";
                                      } else if (value.length < 6) {
                                        return "the password has to be at least 6 characters long";
                                      }
                                      return null;
                                    },
                                  ),
                                  trailing: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          hidePass = !hidePass;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          //signup button
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signUp(_name.text,
                                        _email.text, _password.text)) {
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text('Sign Up failed')));
                                      return;
                                    }
                                    changeScreenReplacement(
                                        context, HomePage());
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //already have account
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "I already have an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

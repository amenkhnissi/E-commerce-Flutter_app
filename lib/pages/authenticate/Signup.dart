
import 'package:fisrtapp/services/auth.dart';
import 'package:flutter/material.dart';
import './Widget/FadeAnimation.dart';

class Signup extends StatefulWidget {
   
   
   final Function toggleView;
  Signup({ this.toggleView });

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 300,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                    height: 300,
                    width: width + 20,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background-2.png'),
                                  fit: BoxFit.fill)),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FadeAnimation(
                          1.5,
                          Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )),
                            SizedBox(
                        width: 80.0,
                      ),
                      FadeAnimation(
                          1.5,
                          FlatButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, 'home');
                              },
                              icon: Icon(Icons.home),
                              label: Text('Home'))),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.7,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    icon: Icon(Icons.email),
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  validator: validateEmail,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  validator: validatePassword,
                                  obscureText: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.9,
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(49, 39, 79, 1),
                        ),
                        child: Center(
                          child: RaisedButton(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                               
                                  
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email.trim(), password.trim());
                                        
                                if (result == null) {

                                  
                                   error = 'Please ...';
                                }
                              }
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      2,
                      Center(
                        child: FlatButton.icon(
                            onPressed: () {
                              widget.toggleView();
                            },
                            icon: Icon(Icons.person),
                            label: Text('Sign in')),
                      )
                      ),
                      SizedBox(height: 10.0),
                      Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Email Validator
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

// Name validator

String validatePassword(String value) {
  if (value.length < 8 || value.isEmpty)
    return 'Password must be >= than 8 charaters';
  else
    return null;
}

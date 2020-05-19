import 'package:fisrtapp/Welcome.dart';
import 'package:fisrtapp/pages/templates/shoppingCart.dart';
import './pages/home/Home.dart';
import './pages/authenticate/Signin.dart';
import './pages/authenticate/Signup.dart';
import './services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        // Named Routes of all the app
        routes: { 
          'home': (context)=> Home(),
          'Signin':(context)=>Signin(),
          'Signup':(context)=>Signup(), 
          'Shopping Cart':(context)=>ShoppingCart(), 
          },
        home: WelcomePage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import './Home.dart';

void main() => runApp(new MaterialApp(routes: <String, WidgetBuilder>{
      "/Home": (context) => MyApp() ,
     
    }, 
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.greenAccent), home: new MyApp()));


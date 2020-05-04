import './authenticate/authenticate.dart';
import '../models/user.dart';
import '../pages/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
   final user = Provider.of<User>(context);
    print(user);

    
    
    
    if (user == null){

      return Authenticate();
    } else {
      return Home()
      ;
    }
}
}


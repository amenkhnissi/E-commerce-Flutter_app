import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/pages/Wrapper.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../templates/Product.dart';
import '../templates/Product_categories.dart';
import '../templates/Shopping_cart.dart';
import '../../services/auth.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import './profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var tabController;
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
 
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Store'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingCart()));
                })
          ],
        ),
        //Drawer

          drawer: Drawer(
          child: ListView(
            children: <Widget>[
              // User account Info

              Profile(),
            
              ListTile(
                leading: Icon(
                  Icons.shop,
                  color: Colors.pink,
                ),
                title: Text('Shop'),
              ),
              ListTile(
                leading: Icon(
                  Icons.accessibility,
                  color: Colors.pink,
                ),
                title: Text('Shop'),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.pink,
                ),
                title: Text('Shop'),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.pink,
                ),
                title: Text('Shop'),
              ),
              Divider(
                height: 2.0,
                color: Colors.black45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(Icons.person),
                      label: Text('Sign out'))
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            
            //Carousol
            SizedBox(
              height: 220.0,
              child: Carousel(boxFit: BoxFit.cover, images: [
                NetworkImage(
                    'https://images.unsplash.com/photo-1515664069236-68a74c369d97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
                NetworkImage(
                    'https://images.unsplash.com/photo-1494607239400-ff147da48308?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1041&q=80'),
              ]),
            ),

            //Categories ListView

            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            Container(height: 100.0, child: ProductCategories()),

            //GridView

            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Products',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            Container(height: 180.0, child: Products()),
            //Fashion Desc

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 300,
                      width: 177.0,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1495385794356-15371f348c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=319&q=80',
                        fit: BoxFit.cover,
                      )),
                  Container(
                    height: 300,
                    width: 183.0,
                    child: GridTile(
                        header: Center(
                            child: Text('New Collections',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 8.0, right: 8.0, bottom: 8.0),
                          child: Text(
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their d',
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 183.0,
                    child: GridTile(
                        header: Center(
                            child: Text('Fashion 2020',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 8.0, right: 8.0),
                          child: Text(
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their d',
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ),
                  Container(
                      height: 300,
                      width: 177.0,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1551212765-dce5ee657676?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
          ],
        ),
        //bottom NavBar

        floatingActionButton: user != null
            ? Text('')
            : FloatingActionButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.redAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Wrapper()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Shop now', style: TextStyle(fontSize: 17.0)),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';

class ShopCartNotification extends StatefulWidget {
  @override
  _ShopCartNotificationState createState() => _ShopCartNotificationState();
}

class _ShopCartNotificationState extends State<ShopCartNotification> {
  DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return    StreamBuilder<QuerySnapshot>(
                    stream: _databaseService.cart,
                    builder: (context, snapshot) {
                      int itemsCount = snapshot.data.documents.length;

                      return IconButton(
                        icon: new Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: new Icon(Icons.shopping_cart),
                            ),
                            new Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: new Stack(
                                children: <Widget>[
                                  new Icon(Icons.brightness_1,
                                      size: 20.0, color: Colors.redAccent[200]),
                                  new Positioned(
                                    top: 1.0,
                                    right: 6.0,
                                    child: itemsCount == null
                                        ? new Text('0',
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500))
                                        : new Text(itemsCount.toString(),
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'Shopping Cart');
                        },
                      );
                    });
  }
}
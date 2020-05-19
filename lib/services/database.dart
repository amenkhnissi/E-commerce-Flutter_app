import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/models/shoppingCart.dart';
import 'package:fisrtapp/models/user.dart';
import 'package:fisrtapp/pages/templates/shoppingCart.dart';

class DatabaseService {
  final String uid;
  DatabaseService({
    this.uid,
  });

  
  // collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  final CollectionReference productsCollection = Firestore.instance.collection('products');
  final CollectionReference categoriesCollection = Firestore.instance.collection('product_category');
  final CollectionReference shopCartCollection = Firestore.instance.collection('shoppingCart');

  Future<void> updateUserData(User user) async {
    return await usersCollection.document(uid).setData({
      'profileImage': user.profileImage,
      'username' : user.username,
      'email' : user.email,
    });
  }

  getData(String uid){ 
    return Firestore.instance.collection('users').document(uid).snapshots();
     }
  // user Stream
  Stream<QuerySnapshot> get user {
    return usersCollection.snapshots();
  }
  // products Stream
  Stream<QuerySnapshot> get product {
    return productsCollection.snapshots();
  }
  // products categories Stream
  Stream<QuerySnapshot> get category {
    return categoriesCollection.snapshots();
  }
  // ShoppingCart Stream
  Stream<QuerySnapshot> get cart {
    return shopCartCollection.snapshots();
  }
  // Add Items to Cart
  Future<void> cartItems(ShopCart cart) async {
    return await Firestore.instance.collection('shoppingCart').add({
      'prodImage': cart.image,
      'prodName' : cart.name,
      'prodColor': cart.color,
      'prodPrice': cart.price,
      'prodCount': cart.count,
      'prodSize':  cart.size,
      
    });

  }


}

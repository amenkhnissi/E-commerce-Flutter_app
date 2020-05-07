import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  final String email;
  DatabaseService({ 
    this.uid,
    this.email
     });

  // collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(String username, String email) async {
    return await usersCollection.document(uid).setData({
      'username' : username,
      'email' : email,
    });
  }

  getData(String uid){ 
    return Firestore.instance.collection('users').document(uid).snapshots();
     }
  
  Stream<QuerySnapshot> get user {
    return usersCollection.snapshots();
  }
  
}

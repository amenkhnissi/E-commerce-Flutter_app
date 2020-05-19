import 'package:firebase_storage/firebase_storage.dart';
import 'package:fisrtapp/models/user.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final profile = user == null ? null : DatabaseService().getData(user.uid);

    void _ShowSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserUpdateForm(),
            );
          });
    }

    return Material(
      child: new StreamBuilder(
          stream: profile,
          builder: (context, snapshot) {
            if (snapshot.hasData) ;
            var user = snapshot.data;

            return UserAccountsDrawerHeader(
              accountName: !snapshot.hasData
                  ? Text('Username')
                  : Text(snapshot.data['username']),
              accountEmail: !snapshot.hasData
                  ? Text('Email account')
                  : Text(snapshot.data['email']),
              currentAccountPicture: CircleAvatar(
                backgroundImage: user['profileImage'] == ''
                    ? AssetImage('assets/images/avatar.jpg')
                    : NetworkImage(user['profileImage']),
              ),
              otherAccountsPictures: <Widget>[
                InkWell(
                    onTap: () {
                      _ShowSettings();
                    },
                    child: Icon(Icons.settings)),
              ],
            );
          }),
    );
  }
}

class UserUpdateForm extends StatefulWidget {
  @override
  _UserUpdateFormState createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DatabaseService database = DatabaseService();
  File _image;
  String _imagelink;
  // text field state
  String _email;
  //String password = '';
  String _username;

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    final profile = user == null ? null : DatabaseService().getData(user.uid);

    // Get Image
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    }

    // Update User profile
    Future updateProfile(BuildContext context,String useremail,String userusername,String userprofileImage) async {

      if (_image != null) {
        String fileName = basename(_image.path);
        String profileImage = "ProfileImage";
        StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(profileImage).child(fileName);
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

        final imageUrl = await firebaseStorageRef.getDownloadURL();
        setState(() {
          _imagelink = imageUrl;
        });
      } else {
        DatabaseService(uid: user.uid).updateUserData(User(
          email: _email == null ? useremail : _email,
          username: _username == null ? userusername : _username,
          profileImage: _imagelink == null ? userprofileImage : _imagelink,
        ));

        Fluttertoast.showToast(msg: 'Profile Successfully updated ');
        Navigator.pop(context);
      }
    }

    
    return 
        StreamBuilder(
          stream: profile,
          builder: (context, snapshot) {
            if(snapshot.hasData);
            var data = snapshot.data;
            return Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 50.0, left: 100.0),
                          child: SizedBox(
                            height: 80.0,
                            width: 80.0,
                            child: CircleAvatar(
                              backgroundImage: _image == null
                                  ? NetworkImage(snapshot.data['profileImage'])
                                  : FileImage(_image),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            await getImage();
                          },
                          child: Icon(Icons.add_a_photo),
                        ),
                      ],
                    ),
                    Text(
                      "Update Profile",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                !snapshot.hasData ? "" : snapshot.data['email'],
                            icon: Icon(Icons.email),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          /* validator: validateEmail, */
                          onChanged: (val) {
                            setState(() => _email = val);
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: !snapshot.hasData
                                ? ""
                                : snapshot.data['username'],
                            icon: Icon(Icons.supervised_user_circle),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),

                          /* validator: (val) {
                          if (val.length < 4 )
                            return 'Invalid username';
                          else
                            return null;
                        }, */
                          onChanged: (val) {
                            setState(() => _username = val);
                          }),
                    ),
                    /* Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          icon: Icon(Icons.lock_outline),
                          hintStyle: TextStyle(color: Colors.grey)),
                      keyboardType: TextInputType.visiblePassword,
                      validator: validatePassword,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                  ), */
                    Center(
                      child: RaisedButton(
                        color: Colors.redAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            updateProfile(context,data['email'],data['username'],data['profileImage']);
                          } else {
                            Fluttertoast.showToast(msg: "Form not validated");
                          }
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
     
  }
}

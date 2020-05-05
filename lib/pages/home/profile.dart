import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtapp/models/user.dart';
import 'package:fisrtapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authenticate/Signin.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final users = Provider.of<QuerySnapshot>(context);

    final profile = DatabaseService().getData(user.uid);

    

    void _ShowSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserUpdateForm(),
            );
          });
    }

    return Material(
      child: new StreamBuilder(
          stream: profile,
          builder: (context, snapshot) {
            return UserAccountsDrawerHeader(
              accountName: !snapshot.hasData
                  ? Text('')
                  : Text(snapshot.data['username']),
              accountEmail:
                  !snapshot.hasData ? Text('') : Text(snapshot.data['email']),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1505022610485-0249ba5b3675?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
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
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final user = Provider.of<User>(context);
    final profile = DatabaseService().getData(user.uid);

    String error = '';

    // text field state
    String _email = 'teste';
    //String password = '';
    String _username = 'testu';

    return StreamBuilder(
      stream: profile,
      builder: (context, snapshot){

      
         return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
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
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: !snapshot.hasData ? "" : snapshot.data['email'],
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
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: !snapshot.hasData ? "" : snapshot.data['username'] ,
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

                  if (_formKey.currentState.validate())  {
                   await DatabaseService(uid: user.uid, email: user.email).updateUserData(
                     _username  ?? snapshot.data['username']  , 
                     _email ?? snapshot.data['email'],
                     ); 
                     print(snapshot.data['email']);
                    Navigator.pop(context);
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
      );
      },
    );
  }
}

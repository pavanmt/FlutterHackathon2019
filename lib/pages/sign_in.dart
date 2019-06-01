/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chat_on/pages/detail_screen.dart'; //important fix

class UserDetails {
  final String providerId;

  final String uid;

  final String displayName;

  final String photoUrl;

  final String email;

  final bool isAnonymous;

  final bool isEmailVerified;

  final List<UserInfoDetails> providerData;

  UserDetails(this.providerId, this.uid, this.displayName, this.photoUrl,
      this.email, this.isAnonymous, this.isEmailVerified, this.providerData);
}

class UserInfoDetails {
  UserInfoDetails(
      this.providerId, this.displayName, this.email, this.photoUrl, this.uid);

  /// The provider identifier.
  final String providerId;

  /// The provider’s user ID for the user.
  final String uid;

  /// The name of the user.
  final String displayName;

  /// The URL of the user’s profile photo.
  final String photoUrl;

  /// The user’s email address.
  final String email;
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UserOptions(), // Default or main screen of the app
    );
  }
}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final GoogleSignIn _gSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in button clicked'),
    ));

    GoogleSignInAccount googleSignInAccount = await _gSignIn.signIn();
    GoogleSignInAuthentication authentication =
    await googleSignInAccount.authentication;

    FirebaseUser user = await _fAuth.signInWithCustomToken(
        token: authentication.idToken,);

    UserInfoDetails userInfo = new UserInfoDetails(
        user.providerId, user.displayName, user.email, user.photoUrl, user.uid);

    List<UserInfoDetails> providerData = new List<UserInfoDetails>();
    providerData.add(userInfo);

    UserDetails details = new UserDetails(
        user.providerId,
        user.uid,
        user.displayName,
        user.photoUrl,
        user.email,
        user.isAnonymous,
        user.isEmailVerified,
        providerData);

    print("User Name : ${user.displayName}");
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new DetailScreen(detailsUser: details),
      ),
    );
    return user;
  }

  void _signOut(BuildContext context) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign out button clicked'),
    ));

    _gSignIn.signOut();
    print('Signed out');
  }

  @override
  Widget build(BuildContext context) {
    final String userName = "Aseem";

    return new MyInhWidget(
        userName: userName,
        child: new Scaffold(
          //backgroundColor: Colors.blueGrey,
          body: new Center(
              child: new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Builder(
                      builder: (BuildContext context) {
                        return new Material(
                          borderRadius: new BorderRadius.circular(30.0),
                          child: new Material(
                            elevation: 5.0,
                            child: new MaterialButton(
                              //padding: new EdgeInsets.all(16.0),
                              minWidth: 150.0,
                              onPressed: () => _signIn(context)
                                  .then((FirebaseUser user) => print(user))
                                  .catchError((e) => print(e)),
                              child: new Text('Sign in with Google'),
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        );
                      },
                    ),
                    new Builder(
                      builder: (BuildContext context) {
                        return new Material(
                          borderRadius: new BorderRadius.circular(30.0),
                          child: new Material(
                            elevation: 5.0,
                            child: new MaterialButton(
                              minWidth: 150.0,
                              onPressed: () => _signOut(context),
                              child: new Text('Sign Out'),
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}

class MyInhWidget extends InheritedWidget {
  const MyInhWidget({Key key, this.userName, Widget child})
      : super(key: key, child: child);

  final String userName;

  //const MyInhWidget(userName, Widget child) : super(child: child);

  @override
  bool updateShouldNotify(MyInhWidget old) {
    return userName != old.userName;
  }

  static MyInhWidget of(BuildContext context) {
    // You could also just directly return the name here
    // as there's only one field
    return context.inheritFromWidgetOfExactType(MyInhWidget);
  }
}
*/

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus{
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    authStatus = widget.auth.currentUser() == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    switch(authStatus){
      case AuthStatus.notSignedIn:
        return new LoginPage(auth: widget.auth, onSignedIn: _signedIn);
      case AuthStatus.signedIn:
        return new Scaffold(
          body: new Container(
          child: new Text('WELCOME!')
        )
        );
    }
    return new LoginPage(auth: widget.auth);
  }
}

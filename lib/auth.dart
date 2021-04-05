import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
}

class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password) async{
    User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async{
    User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }
}
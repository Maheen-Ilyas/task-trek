import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;

@immutable
class AuthUser {
  final String uid;
  const AuthUser(this.uid);

  factory AuthUser.fromFirebase(User user) => AuthUser(user.uid);
}

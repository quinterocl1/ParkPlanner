import 'package:flutter/material.dart';

class User {
  int id;
  String username;
  String password;
  int role;
  String roleName;

  User(
    this.id, 
    this.username, 
    this.password, 
    this.role,
    this.roleName);
}

import 'package:flutter/material.dart';

class Person {
  final String id;
  final String firstname;
  final String lastname;
  //final String username;
  final String email;
  final String password;
  final int mobile;

  Person(
  {@required this.id,
  @required this.firstname,
  @required this.lastname,
  //@required this.username,
  @required this.email,
  @required this.password,
  @required this.mobile,
  });
  }

/*
  Person(this._firstname, this._lastname, this._username, this._email, this._mobile, this._password );

  Person.withId(this._id, this._firstname, this._lastname, this._username, this._email, this._mobile, this._password);

  */
/*Initializing the getters*//*

  int get id => _id;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get username => _username;
  String get email => _email;
  String get password => _password;
  int get mobile => _mobile;


  */
/*Initializing the setters*//*

  set firstname(String newfirstname) {
    if (newfirstname.length <= 20) {
      this._firstname = newfirstname;
    }
  }

  set lastname(String newlastname) {
    if (newlastname.length <= 20) {
      this._lastname = newlastname;
    }
  }

  set username (String newusername) {
    if (newusername.length <= 15) {
      this._username = newusername;
    }
  }

  set email(String newEmail) {
    if (newEmail.length <= 30) {
      this._email = newEmail;
    }
  }

  set password(String newPassword) {
    if (newPassword.length >= 8) {
      this._password = newPassword;
    }
  }

  set mobile(int newMobile) {
    if (newMobile.isFinite) {
      this._mobile = newMobile;
    }
  }


  */
/*Now converting Person object into a Map object*//*

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['mobile'] = _mobile;

    return map;
  }

  */
/*To extract Person object from Map object*//*

  Person.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstname = map['firstname'];
    this._lastname = map['lastname'];
    this._username = map['username'];
    this._email = map['email'];
    this._password = map['password'];
    this._mobile = map['mobile'];
  }


}*/

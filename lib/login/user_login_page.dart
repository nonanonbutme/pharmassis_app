import 'package:flutter/material.dart';
/*import 'dart:async';
import 'package:pharmassist_app/models/users.dart';
import 'package:pharmassist_app/utils/database_helper.dart';
import 'package:pharmassist_app/user_login_page.dart';
import 'package:sqflite/sqflite.dart';*/
import 'package:pharmassist_app/signup/user_signup_page.dart';
import '../patient/user_home_page.dart';
import '../signup/user_signup_page.dart';

class UserLoginPage extends StatefulWidget {
  static String tag = 'user-login-page';
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  @override
  Widget build(BuildContext context) {

    //This side contains just the build for the content

    final headOfintro = Container(
      child: Column(
        children: <Widget>[

          new Text('Welcome to PharmAssist',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, /*fontStyle: FontStyle.italic,*/),
          ),
        ],
      ),
    );

    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100.0,
            child: Image.asset('assets/justthem4.png')
        )
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Email',
        //hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        //errorText: 'don',
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Password',
        hasFloatingPlaceholder: true,
        //hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final loginButton = Padding(
      padding: EdgeInsets.only(bottom: 3.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(UserHomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );



    final forgotLabel = FlatButton(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      onPressed: (){},
    );

    //This side is for the signup text
    final signupIntro = Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Center(
        child: Text(
          'Are you new?',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      ),
    );

    final signupBotton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(UserSignupPage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightGreenAccent[700],
        child: Text('Sign Up here', style: TextStyle(color: Colors.white)),
      ),
    );

//the scaffold returned here is for calling all those built content
    return Scaffold(
      appBar: AppBar(
        title: Text('PharmAssist', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 10.0),
            headOfintro,
            SizedBox(height: 35.0),
            email,
            SizedBox(height: 16.0),
            password,
            forgotLabel,
            SizedBox(height: 2.0),
            loginButton,
            signupIntro,
            signupBotton,

          ],
        ),
      ),
    );
  }
}


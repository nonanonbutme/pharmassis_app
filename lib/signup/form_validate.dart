import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmassist_app/models/users.dart';
/*import 'package:pharmassist_app/signup/user_signup_presenter.dart';
import 'package:pharmassist_app/utils/database_helper.dart';*/
import 'package:pharmassist_app/login/user_login_page.dart';
import 'package:sqflite/sqflite.dart';
import 'form_validate2.dart';


/*This is a form widget*/

class SignUpForm extends StatefulWidget {

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  /*DatabaseHelper helper = DatabaseHelper();*/
  Person person;

  final fnamecol = TextEditingController();
  final snamecol = TextEditingController();
  final usenamecol = TextEditingController();
  final emailcol = TextEditingController();
  final passwdcol = TextEditingController();

  String _firstname;
  String _lastname;
  String _username;
  String _email;
  String _password;
  int _mobile;

  /*UserSignupPagePresenter _presenter;*/

  SignUpFormState();/*{
    _presenter = new UserSignupPagePresenter(this.);
  }*/


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fnamecol.dispose();
    snamecol.dispose();
    usenamecol.dispose();
    emailcol.dispose();
    passwdcol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /*fnamecol.text = person.firstname;
    snamecol.text = person.lastname;
    usenamecol.text = person.username;
    emailcol.text = person.email;
    passwdcol.text = person.password;*/


    //start of the whole show again

    final headOfintro = Container(
      child: Column(
        children: <Widget>[

          new Text('Create Your PharmAssist Account',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, /*fontStyle: FontStyle.italic,*/),
          ),
        ],
      ),
    );

    final signupIntro = Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 30),
      //child: Start(
      child: Text(
        'Please fill up your details below',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500, /*fontStyle: FontStyle.italic,*/
        ),

      ),
      //),
    );


    final fname = TextFormField(
      controller: fnamecol,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your first name';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'First Name',
        //hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      controller: emailcol,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Email',
        hintText: 'example@email.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final sname = TextFormField(
      controller: snamecol,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your surname';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans',),
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans',),
        labelText: 'Surname',
        //hintText: 'Surname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final uname = TextFormField(
      controller: usenamecol,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans',),
        labelText: 'Username',
        //hintText: 'Surname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final password = TextFormField(
      onSaved: (val)=> _password = val,
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Password',
        //hintText: 'Surname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confpassword = TextFormField(
      controller: passwdcol,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Confirm Password',
        //hintText: 'Surname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final nextbut = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        //materialTapTargetSize: MaterialTapTargetSize.padded,
        color: Colors.indigo,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            //this will display a snackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')),);
          }
          //Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(UserLoginPage.tag);

        },
        child: Text(
          'Proceed',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 17.0,

          ),
        ),),

    );

    final gobackbut = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, /*horizontal: .0,*/),
      child: FlatButton(
        //materialTapTargetSize: ,
        onPressed: () {
        },
        child: Text(
          'Sign in instead',
          style: TextStyle(
            color: Colors.indigo,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 17.0,

          ),
        ),
      ),

    );

    return Container(
      child: Form(
        key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30,
                child: Image.asset(
                  'assets/justlogo.png',
                ),
              ),

              SizedBox(height: 15.0),

              headOfintro,
              signupIntro,

              Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: fname),
                    //Expanded(child: SizedBox(width: 0.0)),
                    SizedBox(width: 15.0,),
                    Expanded(child: sname),
                  ],
                ),
              ),

              SizedBox(height: 30.0),
              uname,
              SizedBox(height: 30.0),
              email,
              SizedBox(height: 30.0),

              Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: password),
                    //Expanded(child: SizedBox(width: 0.0)),
                    SizedBox(width: 15.0,),
                    Expanded(child: confpassword),
                  ],
                ),
              ),

              SizedBox(height: 10.0),

              Text('Hint: Best to use 8 or more characters with a mix of letters, numbers and symbols',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,

                ),
              ),

              Container(
                child: Row(

                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 0,
                        child: gobackbut
                    ),
                    //Expanded(child: SizedBox(width: 0.0)),
                    SizedBox(width: 100.0,),
                    Expanded(
                        flex: 0,
                        child: nextbut
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}


/*
void updateFname() {
  person.f
}*/

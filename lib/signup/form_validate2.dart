import 'package:flutter/material.dart';

class SignUpFormNext extends StatefulWidget {
  static String tag = 'SignUpFormNext-page';

  @override
  SignUpFormNextState createState () {
    return SignUpFormNextState();
  }
}

class SignUpFormNextState extends State<SignUpFormNext> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    /*This is the intro part*/
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

    final number = TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans', fontStyle: FontStyle.normal),
        labelText: 'Number',
        //hintText: 'Surname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final dateOfBirth = TextFormField(
      keyboardType: TextInputType.datetime,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Date of Birth',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('PharmAssist', style: TextStyle(color: Colors.white),),
            centerTitle: true,
      ),
          body: Container(
            child: Form(
              key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
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
                  ],
                ),
            ),
          )
    );
  }
}
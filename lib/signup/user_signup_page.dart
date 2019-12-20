import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharmassist_app/models/users.dart';
/*import 'package:pharmassist_app/signup/user_signup_presenter.dart';
import 'package:pharmassist_app/utils/database_helper.dart';*/
import 'package:pharmassist_app/login/user_login_page.dart';
import 'package:sqflite/sqflite.dart';
import 'form_validate.dart';
import '../patient/user_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserSignupPage extends StatefulWidget {
  //this static string tag is for the linker i think
  static String tag = 'user-signup-page';

  @override
  _UserSignupPageState createState() => _UserSignupPageState();
}

class _UserSignupPageState extends State<UserSignupPage> /*implements UserSignupPageContract*/{

  final _formKey = new GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 /* final Map<String, dynamic> _formData = {
    'firstname' : null,
    'lastname' : null,
    'username' : null,
    'email': null,
    'password': null,
    'mobile' : null,
  };
*/
  Person person;

  final fnamecol = TextEditingController();
  final snamecol = TextEditingController();
  final usenamecol = TextEditingController();
  final emailcol = TextEditingController();
  final passwdcol = TextEditingController();
  final passwd2col = TextEditingController();

  BuildContext _ctx;
  bool _isLoading;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _firstname;
  String _lastname;
  String _username;
  String _email;
  String _password;
  int _mobile;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }

    return false;

/*
      print ('form is invalid. Email: $_email, Password: $_password');
*/

  }

  Future<void> validateAndSubmit() async {
    if(validateAndSave()) {
      try {
        AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = _firstname;
        Navigator.of(context).pushNamed(UserLoginPage.tag);
        /*user.updateProfile(userUpdateInfo).then((onValue) {
          Navigator.of(context).pushReplacementNamed(UserLoginPage.tag);
          Firestore.instance.collection('users').document().setData(
              {'email': _email, 'displayName': _firstname}).then((onValue))};*/
        /*AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);*/
        print('Registered user: ${user.user.uid}');
      }
      catch (e) {
        print ('Error: $e');
      }
    }
  }


 /*UserSignupPagePresenter _presenter;

 _UserSignupPageState(){
   _presenter = new UserSignupPagePresenter(this);
 }*/

 /*void _submit() async {
   final form = _formKey.currentState;

   _formKey.currentState.save();
   Map<String, dynamic> successInformation;
   successInformation = await authenticate(
       _formData['email'], _formData['password'], _authMode);
   if (successInformation['success']) {
     // Navigator.pushReplacementNamed(context, '/');
   } else {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text('An Error Occurred!'),
           content: Text(successInformation['message']),
           actions: <Widget>[
             FlatButton(
               child: Text('Okay'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             )
           ],
         );
       },
     );
   }


       *//*() {
     if (_formKey.currentState.validate()) {
       //this will display a snackbar.
       Scaffold.of(context)
           .showSnackBar(SnackBar(content: Text('Processing Data')),);

     }
     //Navigator.of(context).pop();
     Navigator.of(context).pushReplacementNamed(UserLoginPage.tag);

   },*//*

   *//*if(form.validate()){
     setState(() {
       _isLoading = true;
       form.save();
       _presenter.doSignup(_firstname, _lastname, _username, _email, _password, _mobile);
     });
   }*//*
 }*/

/* void _showSnackBar(String text){
   _scaffoldKey.currentState.showSnackBar(new SnackBar(
     content: new Text(text),
   ));
 }*/



  @override
  Widget build(BuildContext context) {

    //this is where the signup forms will be built

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
      onSaved: (String value) {
        /*_formData['firstname']*/_firstname = value;
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
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
        //return;
      },
      onSaved: (String value) {
        /*_formData['email']*/ _email = value;
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
      onSaved: (String value) {
        /*_formData['surname']*/ _lastname = value;
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
      controller: passwdcol,
      validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return 'Password invalid';
          }
          return null;
        },
      onSaved: (value) {
        /*_formData['password']*/ _password = value;
        },
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confpassword = TextFormField(
      controller: passwd2col,
      validator: (value){
      if (passwdcol.text != value || value.isEmpty){
        return 'Passwords do not match';
      }
      return null;
    },
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
        labelText: 'Retype Password',
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
        onPressed: validateAndSubmit/*_submit*/,
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
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(UserLoginPage.tag);
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




    final number = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20.0),
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PharmAssist', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },

        child: Container(
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

                SizedBox(height: 30.0),
                number,


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
        ),
      ),
    );


      /*SignUpForm(),*/
  }

  /*@override
  void onSignupError(String error){
   _showSnackBar(error);
   setState(() {
     _isLoading = false;
   });
  }

  @override
  void onSignupSuccess(Person person) async {
    _showSnackBar(person.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.insertPerson(person);
    Navigator.of(context).pushReplacementNamed(UserLoginPage.tag);

  }*/
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmassist_app/login/doc_login_page.dart';
import 'package:pharmassist_app/patient/complaints.dart';
import 'package:pharmassist_app/patient/pages/complaint.dart';
import 'package:pharmassist_app/signup/form_validate2.dart';
import 'package:pharmassist_app/login/pharm_login_page.dart';
import 'login/user_login_page.dart';
import 'loginchoice_page.dart';
import 'patient/user_home_page.dart';
import 'signup/user_signup_page.dart';

void main() {

  //these are for looking at the positions so so.
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintPointersEnabled = false;
  runApp(MyApp());
}

/*
//use this side for only one element function.
void main() => runApp(MyApp(
  //home: Home(),
));*/

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Map<String, String>> _complaints = [];

  //starts with _ ... cos we don't want this being used by another
  void _addComplaints(Map<String, String> complaint) {
    setState(() {
      _complaints.add(complaint);
      // _datecol.add(/*datecol.text*/ 'non');
    });
  }

  void _deleteComplaints(int index) {
    setState(() {
      _complaints.removeAt(index);
    });
  }



  final routes = <String, WidgetBuilder>{
    DocLoginPage.tag: (context)=>DocLoginPage(),
    LoginChoice.tag: (context)=>LoginChoice(),
    PharmLoginPage.tag: (context)=>PharmLoginPage(),
    SignUpFormNext.tag: (context)=>SignUpFormNext(),
    UserLoginPage.tag: (context)=>UserLoginPage(),
    UserHomePage.tag: (context)=>UserHomePage(),
    UserSignupPage.tag: (context)=>UserSignupPage(),
    //ComplaintPage.tag: (context)=>ComplaintPage(_),
  };



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      title: 'Pharm~Assist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
      ),
      home: LoginChoice(),
      routes: routes,


      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ComplaintPage(
                _complaints[index]['title'], _complaints[index]['image']),
          );
        }
        return null;
      },




    );
  }
}


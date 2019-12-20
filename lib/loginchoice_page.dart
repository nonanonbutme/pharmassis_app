import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login/user_login_page.dart';
import 'login/doc_login_page.dart';
import 'login/pharm_login_page.dart';

class LoginChoice extends StatefulWidget {
  static String tag = 'loginchoice-page';
  @override
  _LoginChoiceState createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> with SingleTickerProviderStateMixin{

  AnimationController _columnAnimationController;
  Animation<double> _columnAnimation;

  @override
  void initState(){
    super.initState();
    _columnAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _columnAnimation = new CurvedAnimation(
        parent: _columnAnimationController,
        curve: Curves.bounceInOut);
    _columnAnimation.addListener(() => this.setState(() {}));
    _columnAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage('assets/logChoicMage.jpg'),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(UserLoginPage.tag);
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    label: Text('User',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightGreen,
                  ),
                ),

                SizedBox(height: 10.0,),

                new ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DocLoginPage.tag);
                    },
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.yellowAccent,
                    ),
                    label: Text('Doctor',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                ),

                SizedBox(height: 10.0,),

                new ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PharmLoginPage.tag);
                    },
                    icon: Icon(
                      Icons.local_pharmacy,
                      color: Colors.amber,
                    ),
                    label: Text('Pharmacist',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.purpleAccent,
                  ),
                ),

              ],
            ),
          ],
        )
    );
  }
}


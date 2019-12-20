import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist_app/patient/complaints_manager.dart';
import '../login/user_login_page.dart';
import '../news/newsList.dart';

class UserHomePage extends StatefulWidget {
  static String tag = 'user-home-page';

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {




  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Colors.white;

    final profilepic = Hero(
      tag: 'Profile Pic',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/profile1.jpg'),
        ),
      ),
    );


    final body = TabBarView(
      children: [
        NewsList(),
        Container(
          padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[

              //this is the complaints list tab.
              Expanded(child: ComplaintManager()),
              /*TextFormField(
                  controller: complaintcol,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please fill in your ailments';
                    }
                    return null;
                  },
                  */ /*onSaved: (String value) {
                      _formData['firstname'] = value;
                    },*/ /*

                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 20.0),
                    labelText: 'Ailments here',

                    contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                RaisedButton(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      _complaints.add(complaintcol.text);
                    });
                  },
                ),
                Divider(),
                Column(
                  children: _complaints.map((element) => ListTile(
                      leading: Text(element)
                  )).toList(),
                ),*/
              /*Text(
                  'No notifications yet',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,),              ),*/
            ],
          ),
        ),

        //This is the notifications tabe.
        Container(
          child: Center(
            child: Text(
              'No Notifications yet',
              style: TextStyle(
                color: Colors.deepOrange,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'OpenSans',
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'News',
                    icon: Icon(Icons.subscriptions),
                  ),
                  Tab(text: 'Complaints', icon: Icon(Icons.send)),
                  Tab(text: 'Notifications', icon: Icon(Icons.notifications)),
                ],
              ),
              title: Text(
                'PharmAssist',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            drawer: new Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Menu'),
                  ),
                  new UserAccountsDrawerHeader(
                    accountName: Text('Ahoma Paa'),
                    accountEmail: Text('amhomapaa@wotiriso.com'),
                    currentAccountPicture: new GestureDetector(
                      child: new CircleAvatar(
                        backgroundImage: AssetImage('assets/profile1.jpg'),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/logChoicMage.jpg'),
                    )),
                  ),
                  new ListTile(
                    title: new Text('Profile'),
                    trailing: new Icon(Icons.perm_identity),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(UserHomePage.tag);
                    },
                  ),
                  Divider(),
                  new ListTile(
                      title: new Text('Manage Complaints'),
                      trailing: new Icon(Icons.dashboard),
                      onTap: () {
                        /*return new ListView(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('New entry'),
                            ),
                            Container()
                          ],
                        );*/
                      }),
                  Divider(),
                  new ListTile(
                    title: new Text('Settings'),
                    trailing: new Icon(Icons.settings),
                    onTap: () {},
                  ),
                  Divider(),
                  SizedBox(height: 50.0),
                  new ListTile(
                    title: new Text('Log Out'),
                    trailing: new Icon(Icons.exit_to_app),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed(UserLoginPage.tag);
                    },
                  ),
                ],
              ),
            ),
            body: body,
          ),
        ),
      ),
    );
  }
}

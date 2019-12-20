import 'package:flutter/material.dart';

class ComplaintPage extends StatelessWidget {

  static String tag = 'complaints-page';

  /*
  * This side must take care of passing the info in the complaints
  * over to this side
  * */


  final String title;
  final String description;

  ComplaintPage(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
                child: Text(
                  'Complaints Details',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              //Text(title),
              Container(
                  padding: EdgeInsets.fromLTRB(
                    0.0,
                    5.0,
                    0.0,
                    10.0,
                  ),
                  child: Text(description)),
              Center(
                child: Text(
                  'The complaints view page',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

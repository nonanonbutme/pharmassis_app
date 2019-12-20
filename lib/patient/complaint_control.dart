import 'package:flutter/material.dart';

class ComplaintControl extends StatelessWidget {
  final Function addComplaint;

  ComplaintControl(this.addComplaint);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(200.0, 5.0, 5.0, 5.0),
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              addComplaint({'title': 'My First', 'description': 'Lalalaland'});
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:pharmassist_app/patient/pages/complaint.dart';

class Complaints extends StatelessWidget {


  //this is the property which stores the constructor
  final List<Map<String, String>> complaints;
  final Function deleteComplaints;

  //this is the constructor that serves as a reference for saving
  Complaints(this.complaints, {this.deleteComplaints}) {
    print('[Complaints Widget] Constructor');
  }

  Widget _builderComplaintItem(BuildContext context, int index) {
    print('[Complaints Widget] build()');
    return ListTile(
      title: Text(complaints[index]['title']),
      leading: Text(complaints[index]['description']),
      subtitle: Text('Tap to view more details'),
      onTap: () {
        Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ComplaintPage(
                complaints[index]['title'], complaints[index]['description']),
          ),
        ).then((bool value) {
          if (value) {
            deleteComplaints(index);
          }
        });
      },
    );
  }

  Widget _buildComplaintsList() {
    Widget complaintshold;
    if (complaints.length > 0) {
      complaintshold = ListView.builder(
        itemBuilder: _builderComplaintItem, //this one builds items
        itemCount: complaints.length,
      );
    } else {
      complaintshold =
          Center(child: Text('No Complaints found, please add one'));
    }

    return complaintshold;
  }

  @override
  Widget build(BuildContext context) {
    /*print('[Products Widget] build()');

    Widget complaintshold = Center(
      child: Text('No Complaints found, please add one'),
    );
    if (complaints.length > 0){
      complaintshold = ListView.builder(
        itemBuilder: _builderComplaintItem, //this one builds items
        itemCount: complaints.length,
      );
    }*/

    print('[Products Widget] build()');

    return _buildComplaintsList();

    /*here is an if statement bool... AKA ternary expression*/ /*
        complaints.length > 0
            ? ListView.builder(
                itemBuilder: _builderComplaintItem, //this one builds items
                itemCount: complaints.length,
              )
            : */ /*else*/ /* Center(
                child: Text('No Complaints found, please add one'),
              );*/
  }
}

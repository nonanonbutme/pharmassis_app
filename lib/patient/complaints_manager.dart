import 'package:flutter/material.dart';
import 'package:pharmassist_app/patient/complaints.dart';
import 'package:pharmassist_app/patient/complaint_control.dart';

class ComplaintManager extends StatefulWidget {

  final Map<String, String> StartingComplaint;
              //*** this side is the receiver of new external data
  ComplaintManager({this.StartingComplaint /*= 'I am sick'*/}){
    print('[ComplaintsManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ComplaintsManager Widget] CreatState()');

    return _ComplaintManagerState();
  }
}

class _ComplaintManagerState extends State<ComplaintManager> {

  final List<Map<String, String>> _complaints = [];


  @override
  void initState() {
    print('[ComplaintsManager State] initState()');
    if (widget.StartingComplaint != null){
      _complaints.add(widget.StartingComplaint);
    }
    super.initState();
  }

  //this executes whenever new data is received by connected widget ***
  @override
  void didUpdateWidget(ComplaintManager oldWidget) {
    print('[ComplaintsManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

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


  @override
  Widget build(BuildContext context) {
    print('[ComplaintsManager State] build()');

    return Container(
      child: Column(
        children: <Widget>[
          /*TextFormField(
            controller: datecol,
            validator: (value) {
              if (value.isEmpty) {
                return 'Input the date';
              }
              return null;
            },
            */ /*onSaved: (Map value) {
                            _formData['firstname'] = value;
                          },*/ /*

            keyboardType: TextInputType.datetime,
            autofocus: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 20.0),
              labelText: 'Date here',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            controller: complaintcol,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please fill in your ailments';
              }
              return null;
            },
            */ /*onSaved: (Map value) {
                            _formData['firstname'] = value;
                          },*/ /*

            maxLines: 5,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 20.0),
              labelText: 'Ailments here',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),*/

          ComplaintControl(_addComplaints),
          Divider(),
          Expanded(child: Complaints(_complaints, deleteComplaints: _deleteComplaints))
        ],
      ),
    );
  }
}

import 'package:dpis_app/Assignment/assign_req.dart';
import 'package:dpis_app/utils/margin.dart';
import 'package:flutter/material.dart';

class GiveAssignment extends StatefulWidget {
  @override
  _GiveAssignmentState createState() => _GiveAssignmentState();
}

class _GiveAssignmentState extends State<GiveAssignment> {
  final _formKey = GlobalKey<FormState>();
  final _subject = TextEditingController();
  final _class = TextEditingController();
  final _topic = TextEditingController();
  final _question = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Give Assignment',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Metropolis'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(40),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 70,
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: TextFormField(
                          controller: _subject,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              // errorBorder: ,
                              disabledBorder: InputBorder.none,
                              labelText: 'Subject',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Subject'),
                        )),
                  )),
            ),
            YMargin(15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 70,
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: TextFormField(
                          controller: _class,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              // errorBorder: ,
                              disabledBorder: InputBorder.none,
                              labelText: 'Class',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Class'),
                        )),
                  )),
            ),
            YMargin(15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 70,
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: TextFormField(
                          controller: _topic,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              // errorBorder: ,
                              disabledBorder: InputBorder.none,
                              labelText: 'Topic',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Topic'),
                        )),
                  )),
            ),
            YMargin(15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 200,
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: TextFormField(
                          controller: _question,
                          maxLines: 20,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              // errorBorder: ,
                              disabledBorder: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Type Question here'),
                        )),
                  )),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepPurple[900],
                  onPressed: () {
                    AssRequests().uploadassignment(_subject.text, _class.text,
                        _topic.text, _question.text, context);
                  },
                  child: Text("Post Assignment",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Metropolis')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

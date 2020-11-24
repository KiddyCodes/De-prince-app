import 'package:dpis_app/jss2.dart';
import 'package:dpis_app/jss3.dart';
import 'package:dpis_app/ss2.dart';
import 'package:dpis_app/ss3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'jss1.dart';
import 'ss1.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool notChecked = false, isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200,
              width: 500,
              color: Colors.deepPurple[900],
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Center(
                            child: Container(
                              child: Text(
                                "View Result",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
        GestureDetector(
          onTap: () {
            showAlertDialog2(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Card(
                      shadowColor: Colors.deepOrangeAccent[900],
                      elevation: 20,
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "Junior Secondary School",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 19),
                          ),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    showAlertDialog1(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Card(
                          shadowColor: Colors.deepOrangeAccent[900],
                          elevation: 20,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                "Senior Secondary School",
                                style: TextStyle(
                                    color: Colors.deepPurple[900],
                                    fontSize: 19),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void showAlertDialog1(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: AlertDialog(
              title: Column(
                children: [
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SS1()));
                              },
                              child: Text(
                                'SS1',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SS2()));
                              },
                              child: Text(
                                'SS2',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SS3()));
                              },
                              child: Text(
                                'SS3',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.deepPurple[900]),
                    ))
              ],
            ),
          );
        });
  }

  void showAlertDialog2(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: AlertDialog(
              title: Column(
                children: [
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JSS1()));
                              },
                              child: Text(
                                'JSS1',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JSS2()));
                              },
                              child: Text(
                                'JSS2',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Container(
                        width: 200,
                        height: 100,
                        child: Card(
                          elevation: 10,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JSS3()));
                              },
                              child: Text(
                                'JSS3',
                                style: TextStyle(color: Colors.deepPurple[900]),
                              )),
                        )),
                  ),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.deepPurple[900]),
                    ))
              ],
            ),
          );
        });
  }
}

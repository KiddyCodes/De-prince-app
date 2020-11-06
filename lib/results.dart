import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool notChecked = false;

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
                    child: Center(
                      child: Container(
                        child: Text(
                          "View Result",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 50),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 80,
                child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Center(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "jss1-3",
                            style: TextStyle(
                                color: Colors.deepPurple[900], fontSize: 15),
                          ),
                        ),
                        Checkbox(
                            activeColor: Colors.deepPurple[900],
                            tristate: false,
                            value: notChecked,
                            onChanged: (bool value) {
                              setState(() {
                                notChecked = value;
                              });
                            })
                      ],
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  height: 100,
                  width: 80,
                  child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "ss1-3",
                              style: TextStyle(
                                  color: Colors.deepPurple[900], fontSize: 15),
                            ),
                          ),
                          Checkbox(
                              activeColor: Colors.deepPurple[900],
                              tristate: false,
                              value: notChecked,
                              onChanged: (value) {
                                setState(() {
                                  notChecked = value;
                                });
                              })
                        ],
                      ))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 185, right: 10),
          child: Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () {
                  showAlertDialog(context);
                },
                label: Row(
                  children: [
                    Text(
                      "click here",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[900]),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.deepPurple[900],
                    ),
                  ],
                )),
          ),
        ),
      ]),
    );
  }

  void showAlertDialog(BuildContext context) {
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
                              onPressed: () {},
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
                              onPressed: () {},
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
                              onPressed: () {},
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
}

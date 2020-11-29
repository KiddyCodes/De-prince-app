import 'package:dpis_app/Assignment/assign_Model.dart';
import 'package:dpis_app/Assignment/assign_req.dart';
import 'package:flutter/material.dart';

import '../staffhome.dart';

class GetAssignment extends StatefulWidget {
  @override
  _GetAssignmentState createState() => _GetAssignmentState();
}

class _GetAssignmentState extends State<GetAssignment> {
  Future<GetAssignmentModel> _future;
  @override
  void initState() {
    _future = AssRequests().getnassignmentreq();
    super.initState();
  }

  Future<GetAssignmentModel> _getData() async {
    setState(() {
      _future = AssRequests().getnassignmentreq();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Assignments',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: FutureBuilder<GetAssignmentModel>(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _future = AssRequests().getnassignmentreq();
                        });
                      },
                      child: Text('Retry'),
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _future = AssRequests().getnassignmentreq();
                          });
                        },
                        child: Text('Retry'),
                      ),
                    );
                  } else if (snapshot.data == null) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: primcolor,
                            onPressed: () {
                              setState(() {
                                _future = AssRequests().getnassignmentreq();
                              });
                            },
                            child: Text('Connection Problem, try again',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.data.assignment.isEmpty) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                          child: RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            color: primcolor,
                            onPressed: () {
                              setState(() {
                                _future = AssRequests().getnassignmentreq();
                              });
                            },
                            child: Text('You have no notes',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: _getData,
                      child: ListView.builder(
                          itemCount: snapshot.data.assignment.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {},
                                  leading: Text(
                                    snapshot.data.assignment[index].subject,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data.assignment[index].topic,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data.assignment[index].questions,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ));
                          }),
                    );
                  }
              }
            }));
    // body: SingleChildScrollView(
    //   child: Column(children: [
    //     SizedBox(
    //       height: 20,
    //     ),
    //     GestureDetector(
    //       child: Card(
    //           elevation: 5,
    //           child: ListTile(
    //             title: Text(
    //               'Biology',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             subtitle: Text(
    //               'Ecological Succesion',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.w300,
    //               ),
    //             ),
    //           )),
    //       onTap: () {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => ViewNotes()));
    //       },
    //     ),
    //   ]),
    // ));
  }
}

import 'package:dpis_app/requests/authRequests.dart';
import 'package:flutter/material.dart';

import '../notification.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _staffName = TextEditingController();
  final _staffpass = TextEditingController();
  final _staffid = TextEditingController();
  final _staffemail = TextEditingController();
  final _staffphone = TextEditingController();
  final _subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          showAdd(context);
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.blue[900],
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 290.0,
                  child: Card(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.red[900],
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Notifications()));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showAdd(BuildContext context) {
  final _staffName = TextEditingController();
  final _staffpass = TextEditingController();
  final _staffid = TextEditingController();
  final _staffemail = TextEditingController();
  final _staffphone = TextEditingController();
  final _subject = TextEditingController();
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
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  elevation: 4.0,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0)),
                                  ),
                                  builder: (BuildContext bc) {
                                    return SingleChildScrollView(
                                      reverse: true,
                                      child: Container(
                                        height: 800,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 80,
                                            ),
                                            SingleChildScrollView(
                                              reverse: true,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Container(
                                                    height: 70,
                                                    child: Card(
                                                      shadowColor: Colors.black,
                                                      color: Colors.white,
                                                      elevation: 4.0,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 1),
                                                          child: TextFormField(
                                                            controller:
                                                                _staffName,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                new InputDecoration(
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    // errorBorder: ,
                                                                    disabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    labelText:
                                                                        'Staff Name',
                                                                    labelStyle: TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                    contentPadding: EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            11,
                                                                        top: 11,
                                                                        right:
                                                                            15),
                                                                    hintText:
                                                                        'Staff Name'),
                                                          )),
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          controller:
                                                              _staffpass,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          obscureText: true,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'Password',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'Password'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          controller: _staffid,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'StaffId',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'StaffId'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          controller:
                                                              _staffemail,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'email',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'email'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          controller:
                                                              _staffphone,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'PhoneNumber',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'PhoneNumber'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          controller: _subject,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'Subject  ',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'Subject'),
                                                        )),
                                                  )),
                                            ),
                                            SizedBox(height: 70),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Container(
                                                height: 50,
                                                width: 200,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  color: Colors.deepPurple[900],
                                                  onPressed: () {
                                                    AuthRequests().staffSignUp(
                                                        _staffName.text,
                                                        _staffemail.text,
                                                        _staffpass.text,
                                                        _staffphone.text,
                                                        _staffid.text,
                                                        _subject.text,
                                                        context);
                                                  },
                                                  child: Text("Add Staff",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Metropolis')),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'Add Staff',
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
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  elevation: 4.0,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0)),
                                  ),
                                  builder: (BuildContext bc) {
                                    return SingleChildScrollView(
                                      reverse: true,
                                      child: Container(
                                        height: 800,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 80,
                                            ),
                                            SingleChildScrollView(
                                              reverse: true,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Container(
                                                    height: 70,
                                                    child: Card(
                                                      shadowColor: Colors.black,
                                                      color: Colors.white,
                                                      elevation: 4.0,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 1),
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            decoration:
                                                                new InputDecoration(
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    // errorBorder: ,
                                                                    disabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    labelText:
                                                                        'Student Name',
                                                                    labelStyle: TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                    contentPadding: EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            11,
                                                                        top: 11,
                                                                        right:
                                                                            15),
                                                                    hintText:
                                                                        'Student Name'),
                                                          )),
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'StudentId',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'StudentId'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          obscureText: true,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'Password',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'Password'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'Date of Birth',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'Date of Birth'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'PhoneNumber',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'PhoneNumber'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'email',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'class'),
                                                        )),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                  height: 70,
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    color: Colors.white,
                                                    elevation: 4.0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 1),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              new InputDecoration(
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  // errorBorder: ,
                                                                  disabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  labelText:
                                                                      'Course',
                                                                  labelStyle: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15,
                                                                          bottom:
                                                                              11,
                                                                          top:
                                                                              11,
                                                                          right:
                                                                              15),
                                                                  hintText:
                                                                      'Course'),
                                                        )),
                                                  )),
                                            ),
                                            SizedBox(height: 70),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Container(
                                                height: 50,
                                                width: 200,
                                                child: RaisedButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  color: Colors.deepPurple[900],
                                                  onPressed: () {},
                                                  child: Text("Add Student",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Metropolis')),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'Add Student',
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

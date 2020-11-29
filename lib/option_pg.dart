import 'dart:async';
import 'package:dpis_app/Admin/adminHome.dart';
import 'package:dpis_app/home.dart';
import 'package:dpis_app/staffhome.dart';
import 'package:flutter/material.dart';

import 'requests/authRequests.dart';

class Firstpg extends StatefulWidget {
  @override
  _FirstpgState createState() => _FirstpgState();
}

class _FirstpgState extends State<Firstpg> {
  bool splash = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _staffId = TextEditingController();
  final _staffPass = TextEditingController();

  final _adminName = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {
      splash = !splash;
      setState(() {
        Firstpg();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: splash
          ? FloatingActionButton.extended(
              backgroundColor: Colors.deepPurple[900],
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    elevation: 4.0,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),
                    builder: (BuildContext bc) {
                      return SingleChildScrollView(
                        reverse: true,
                        child: Container(
                          height: 500,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "ONLY FOR ADMINS",
                                style: TextStyle(fontSize: 20),
                              ),
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
                                                const EdgeInsets.only(top: 1),
                                            child: TextFormField(
                                              controller: _adminName,
                                              keyboardType: TextInputType.text,
                                              decoration: new InputDecoration(
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  // errorBorder: ,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'AdminId',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 15,
                                                          bottom: 11,
                                                          top: 11,
                                                          right: 15),
                                                  hintText: 'AdminId'),
                                            )),
                                      )),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                    height: 70,
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 4.0,
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 1),
                                          child: TextFormField(
                                            controller: _password,
                                            keyboardType: TextInputType.text,
                                            obscureText: true,
                                            decoration: new InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                // errorBorder: ,
                                                disabledBorder:
                                                    InputBorder.none,
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                    color: Colors.grey),
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: 'Password'),
                                          )),
                                    )),
                              ),
                              SizedBox(height: 70),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color: Colors.deepPurple[900],
                                    onPressed: () {
                                      AuthRequests().adminSignIn(
                                          _adminName.text,
                                          _password.text,
                                          context);
                                    },
                                    child: Text("Login",
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
                    });
              },
              label: Row(children: [Icon(Icons.verified_user), Text("ADMIN")]))
          : SizedBox(),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Align(
              alignment: splash ? Alignment.topCenter : Alignment.center,
              child: AnimatedContainer(
                height: splash ? 200 : 500,
                width: splash ? 100 : 250,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  'assets/logodp.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: splash
                ? Container(
                    height: 50,
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.deepPurple[900],
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
                                  height: 500,
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
                                                        const EdgeInsets.only(
                                                            top: 1),
                                                    child: TextFormField(
                                                      controller:
                                                          _emailController,
                                                      keyboardType:
                                                          TextInputType.text,
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
                                                                      left: 15,
                                                                      bottom:
                                                                          11,
                                                                      top: 11,
                                                                      right:
                                                                          15),
                                                              hintText:
                                                                  'StudentId'),
                                                    )),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30),
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
                                                      const EdgeInsets.only(
                                                          top: 1),
                                                  child: TextFormField(
                                                    controller:
                                                        _passwordController,
                                                    keyboardType:
                                                        TextInputType.text,
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
                                                            labelStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    bottom: 11,
                                                                    top: 11,
                                                                    right: 15),
                                                            hintText:
                                                                'Password'),
                                                  )),
                                            )),
                                      ),
                                      SizedBox(height: 70),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            color: Colors.deepPurple[900],
                                            onPressed: () {
                                              AuthRequests().userSignIn(
                                                  _emailController.text,
                                                  _passwordController.text,
                                                  context);
                                            },
                                            child: Text("Login",
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
                            });
                      },
                      child: Text("Login as Student",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'Metropolis')),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: splash
                ? Container(
                    height: 50,
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.red[700],
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                            ),
                            builder: (BuildContext bc) {
                              return Container(
                                height: 500,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
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
                                                padding: const EdgeInsets.only(
                                                    top: 1),
                                                child: TextFormField(
                                                  controller: _staffId,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      new InputDecoration(
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          // errorBorder: ,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          labelText: 'StaffId',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  bottom: 11,
                                                                  top: 11,
                                                                  right: 15),
                                                          hintText: 'StaffId'),
                                                )),
                                          )),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                30),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                          height: 70,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 4.0,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 1),
                                                child: TextFormField(
                                                  controller: _staffPass,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: true,
                                                  decoration:
                                                      new InputDecoration(
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          // errorBorder: ,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          labelText: 'Password',
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  bottom: 11,
                                                                  top: 11,
                                                                  right: 15),
                                                          hintText: 'Password'),
                                                )),
                                          )),
                                    ),
                                    SizedBox(height: 70),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: Colors.red[700],
                                          onPressed: () {
                                            AuthRequests().staffSignIn(
                                                _staffId.text,
                                                _staffPass.text,
                                                context);
                                          },
                                          child: Text("Login",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontFamily: 'Metropolis')),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text("Login as Staff",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'Metropolis')),
                    ),
                  )
                : SizedBox(),
          ),
        ]),
      ),
    );
  }
}

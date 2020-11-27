import 'dart:io';

import 'package:dpis_app/Admin/getstudnum_modesl.dart';
import 'package:dpis_app/Admin/getstudnumreq.dart';
import 'package:dpis_app/requests/authRequests.dart';
import 'package:dpis_app/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../notification.dart';
import '../staffhome.dart';
import 'getstffnummodel.dart';

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
  final _studName = TextEditingController();
  final _studpass = TextEditingController();
  final _studid = TextEditingController();
  final _studemail = TextEditingController();
  final _studphone = TextEditingController();
  final _course = TextEditingController();
  final _class = TextEditingController();
  final _age = TextEditingController();
  File _imageFile;
  File _imageFilei;

  void _getImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().getImage(
      source: source,
      maxWidth: 800,
    );
    setState(() {
      // _imageFile = image.path;
      _imageFile = File(image.path);
      _imageFilei = File(image.path);
    });
    // Closes the bottom sheet
    Navigator.pop(context);
  }

  Future<GetStudNumModel> _future;
  Future<GetStaffNumModel> _future2;
  @override
  void initState() {
    _future = Getnumreq().getStudNum();
    _future2 = Getnumreq().getStaffNum();
    super.initState();
  }

  Future<GetStudNumModel> _getData() async {
    setState(() {
      _future = Getnumreq().getStudNum();
    });
  }

  Future<GetStaffNumModel> _getData2() async {
    setState(() {
      _future2 = Getnumreq().getStaffNum();
    });
  }

  void openImagePickerModal(BuildContext context) {
    print('Image Picker Modal Called');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black.withOpacity(0.9),
            child: Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).backgroundColor,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Choose an option',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[700]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    textColor: Colors.black,
                    child: Text('Take a Picture'),
                    onPressed: () {
                      _getImage(context, ImageSource.camera);
                    },
                  ),
                  FlatButton(
                    textColor: Colors.black,
                    child: Text('Pick Image from Gallery'),
                    onPressed: () {
                      _getImage(context, ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          onPressed: () {
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          20.0)),
                                            ),
                                            builder: (BuildContext bc) {
                                              return SingleChildScrollView(
                                                reverse: true,
                                                child: Container(
                                                  height: 800,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            openImagePickerModal(
                                                                context);
                                                            print("hello");
                                                          },
                                                          child: Container(
                                                            height: 120.0,
                                                            width: 120.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.1),
                                                              image:
                                                                  DecorationImage(
                                                                image: _imageFile !=
                                                                        null
                                                                    ? FileImage(
                                                                        _imageFile)
                                                                    : AssetImage(
                                                                        'assets/logodp.png'),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.add_a_photo,
                                                              size: 43,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )),
                                                      SingleChildScrollView(
                                                        reverse: true,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _staffName,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'Staff Name',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'Staff Name'),
                                                                    )),
                                                              )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                            height: 70,
                                                            child: Card(
                                                              color:
                                                                  Colors.white,
                                                              elevation: 4.0,
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 1),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _staffpass,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    obscureText:
                                                                        true,
                                                                    decoration: new InputDecoration(
                                                                        focusedBorder: InputBorder.none,
                                                                        enabledBorder: InputBorder.none,
                                                                        // errorBorder: ,
                                                                        disabledBorder: InputBorder.none,
                                                                        labelText: 'Password',
                                                                        labelStyle: TextStyle(color: Colors.grey),
                                                                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                        hintText: 'Password'),
                                                                  )),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                            height: 70,
                                                            child: Card(
                                                              shadowColor:
                                                                  Colors.black,
                                                              color:
                                                                  Colors.white,
                                                              elevation: 4.0,
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 1),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _staffid,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    decoration: new InputDecoration(
                                                                        focusedBorder: InputBorder.none,
                                                                        enabledBorder: InputBorder.none,
                                                                        // errorBorder: ,
                                                                        disabledBorder: InputBorder.none,
                                                                        labelText: 'StaffId',
                                                                        labelStyle: TextStyle(color: Colors.grey),
                                                                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                        hintText: 'StaffId'),
                                                                  )),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                            height: 70,
                                                            child: Card(
                                                              shadowColor:
                                                                  Colors.black,
                                                              color:
                                                                  Colors.white,
                                                              elevation: 4.0,
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 1),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _staffemail,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                    decoration: new InputDecoration(
                                                                        focusedBorder: InputBorder.none,
                                                                        enabledBorder: InputBorder.none,
                                                                        // errorBorder: ,
                                                                        disabledBorder: InputBorder.none,
                                                                        labelText: 'email',
                                                                        labelStyle: TextStyle(color: Colors.grey),
                                                                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                        hintText: 'email'),
                                                                  )),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                            height: 70,
                                                            child: Card(
                                                              shadowColor:
                                                                  Colors.black,
                                                              color:
                                                                  Colors.white,
                                                              elevation: 4.0,
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 1),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _staffphone,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    decoration: new InputDecoration(
                                                                        focusedBorder: InputBorder.none,
                                                                        enabledBorder: InputBorder.none,
                                                                        // errorBorder: ,
                                                                        disabledBorder: InputBorder.none,
                                                                        labelText: 'PhoneNumber',
                                                                        labelStyle: TextStyle(color: Colors.grey),
                                                                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                        hintText: 'PhoneNumber'),
                                                                  )),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Container(
                                                            height: 70,
                                                            child: Card(
                                                              shadowColor:
                                                                  Colors.black,
                                                              color:
                                                                  Colors.white,
                                                              elevation: 4.0,
                                                              child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 1),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _subject,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    decoration: new InputDecoration(
                                                                        focusedBorder: InputBorder.none,
                                                                        enabledBorder: InputBorder.none,
                                                                        // errorBorder: ,
                                                                        disabledBorder: InputBorder.none,
                                                                        labelText: 'Subject  ',
                                                                        labelStyle: TextStyle(color: Colors.grey),
                                                                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                        hintText: 'Subject'),
                                                                  )),
                                                            )),
                                                      ),
                                                      SizedBox(height: 70),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10.0),
                                                        child: Container(
                                                          height: 50,
                                                          width: 200,
                                                          child: RaisedButton(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            color: Colors
                                                                    .deepPurple[
                                                                900],
                                                            onPressed: () {
                                                              AuthRequests()
                                                                  .staffSignUp(
                                                                      _staffName
                                                                          .text,
                                                                      _staffemail
                                                                          .text,
                                                                      _staffpass
                                                                          .text,
                                                                      _staffphone
                                                                          .text,
                                                                      _staffid
                                                                          .text,
                                                                      _subject
                                                                          .text,
                                                                      _imageFile,
                                                                      context);
                                                            },
                                                            child: Text(
                                                                "Add Staff",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white,
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
                                        style: TextStyle(
                                            color: Colors.deepPurple[900]),
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          20.0)),
                                            ),
                                            builder: (BuildContext bc) {
                                              return SafeArea(
                                                child: SingleChildScrollView(
                                                  reverse: true,
                                                  child: Container(
                                                    height: 850,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              openImagePickerModal(
                                                                  context);
                                                              print("hello");
                                                            },
                                                            child: Container(
                                                              height: 100.0,
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.1),
                                                                image:
                                                                    DecorationImage(
                                                                  image: _imageFilei !=
                                                                          null
                                                                      ? FileImage(
                                                                          _imageFilei)
                                                                      : AssetImage(
                                                                          'assets/logodp.png'),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .add_a_photo,
                                                                size: 43,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )),
                                                        SingleChildScrollView(
                                                          reverse: true,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15,
                                                                    right: 15),
                                                            child: Container(
                                                                height: 70,
                                                                child: Card(
                                                                  shadowColor:
                                                                      Colors
                                                                          .black,
                                                                  color: Colors
                                                                      .white,
                                                                  elevation:
                                                                      4.0,
                                                                  child: Padding(
                                                                      padding: const EdgeInsets.only(top: 1),
                                                                      child: TextFormField(
                                                                        controller:
                                                                            _studName,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        decoration: new InputDecoration(
                                                                            focusedBorder: InputBorder.none,
                                                                            enabledBorder: InputBorder.none,
                                                                            // errorBorder: ,
                                                                            disabledBorder: InputBorder.none,
                                                                            labelText: 'Student Name',
                                                                            labelStyle: TextStyle(color: Colors.grey),
                                                                            contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                            hintText: 'Student Name'),
                                                                      )),
                                                                )),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _studid,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'StudentId',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'StudentId'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _class,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'Class',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'Class'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _studpass,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      obscureText:
                                                                          true,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'Password',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'Password'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _age,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .datetime,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'Date of Birth',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'Date of Birth'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _studphone,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'PhoneNumber',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'PhoneNumber'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _studemail,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .emailAddress,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'email',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'email'),
                                                                    )),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Container(
                                                              height: 70,
                                                              child: Card(
                                                                shadowColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .white,
                                                                elevation: 4.0,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 1),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _course,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration: new InputDecoration(
                                                                          focusedBorder: InputBorder.none,
                                                                          enabledBorder: InputBorder.none,
                                                                          // errorBorder: ,
                                                                          disabledBorder: InputBorder.none,
                                                                          labelText: 'Course',
                                                                          labelStyle: TextStyle(color: Colors.grey),
                                                                          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                                                          hintText: 'Course'),
                                                                    )),
                                                              )),
                                                        ),
                                                        SizedBox(height: 70),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 10.0),
                                                          child: Container(
                                                            height: 50,
                                                            width: 200,
                                                            child: RaisedButton(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              color: Colors
                                                                      .deepPurple[
                                                                  900],
                                                              onPressed: () {
                                                                AuthRequests().studentSignUp(
                                                                    _studName
                                                                        .text,
                                                                    _studemail
                                                                        .text,
                                                                    _studpass
                                                                        .text,
                                                                    _studphone
                                                                        .text,
                                                                    _age.text,
                                                                    _class.text,
                                                                    _studid
                                                                        .text,
                                                                    _course
                                                                        .text,
                                                                    _imageFilei,
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "Add Student",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Metropolis')),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Add Student',
                                        style: TextStyle(
                                            color: Colors.deepPurple[900]),
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
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: FutureBuilder<GetStudNumModel>(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _future = Getnumreq().getStudNum();
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
                            _future = Getnumreq().getStudNum();
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
                                _future = Getnumreq().getStudNum();
                              });
                            },
                            child: Text('Connection Problem, try again',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.data.result.isNaN) {
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
                                _future = Getnumreq().getStudNum();
                              });
                            },
                            child: Text('null',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: _getData,
                      child: Column(
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
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
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
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0),
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
                                                        builder: (context) =>
                                                            Notifications()));
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 80.0, right: 40),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 70.0,
                                  lineWidth: 9.0,
                                  animation: true,
                                  percent: 0.5,
                                  center: new Text(
                                    snapshot.data.result.toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  footer: new Text(
                                    "Student",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.deepPurple[700],
                                ),
                                XMargin(90),
                                FutureBuilder<GetStaffNumModel>(
                                    future: _future2,
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return Center(
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _future2 =
                                                      Getnumreq().getStaffNum();
                                                });
                                              },
                                              child: Text('Retry'),
                                            ),
                                          );
                                        case ConnectionState.waiting:
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        case ConnectionState.active:
                                          return Text('');
                                        case ConnectionState.done:
                                          if (snapshot.hasError) {
                                            return Center(
                                              child: RaisedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _future2 = Getnumreq()
                                                        .getStaffNum();
                                                  });
                                                },
                                                child: Text('Retry'),
                                              ),
                                            );
                                          } else if (snapshot.data == null) {
                                            return Center(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                child: Center(
                                                  child: RaisedButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    color: primcolor,
                                                    onPressed: () {
                                                      setState(() {
                                                        _future2 = Getnumreq()
                                                            .getStaffNum();
                                                      });
                                                    },
                                                    child: Text(
                                                        'Connection Problem, try again',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else if (snapshot
                                              .data.result.isNaN) {
                                            return Center(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                child: Center(
                                                  child: RaisedButton(
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                    color: primcolor,
                                                    onPressed: () {
                                                      setState(() {
                                                        _future2 = Getnumreq()
                                                            .getStaffNum();
                                                      });
                                                    },
                                                    child: Text('null',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return RefreshIndicator(
                                              onRefresh: _getData2,
                                              child: CircularPercentIndicator(
                                                radius: 70.0,
                                                lineWidth: 9.0,
                                                animation: true,
                                                percent: 0.5,
                                                center: new Text(
                                                  snapshot.data.result
                                                      .toString(),
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                ),
                                                footer: new Text(
                                                  "Staff",
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17.0),
                                                ),
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                progressColor:
                                                    Colors.deepPurple[700],
                                              ),
                                            );
                                            // Column(children: [
                                            //   Row(
                                            //     children: [
                                            //       Column(
                                            //         children: [

                                            //           Text(
                                            //             "Staffs",
                                            //             style: TextStyle(
                                            //                 fontSize:
                                            //                     20,
                                            //                 color: Colors
                                            //                         .deepPurple[
                                            //                     700]),
                                            //           )
                                            //         ],
                                            //       )
                                            //     ],
                                            //   ),
                                            // ])));
                                          }
                                      }
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

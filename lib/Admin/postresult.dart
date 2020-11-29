import 'dart:io';

import 'package:dpis_app/result/resultreq.dart';
import 'package:dpis_app/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../staffhome.dart';

class Postrslt extends StatefulWidget {
  @override
  _PostrsltState createState() => _PostrsltState();
}

final _studentName = TextEditingController();
final _term = TextEditingController();
final _class = TextEditingController();
File _imageFile;

class _PostrsltState extends State<Postrslt> {
  void _getImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().getImage(
      source: source,
      maxWidth: 800,
    );
    setState(() {
      // _imageFile = image.path;
      _imageFile = File(image.path);
    });
    // Closes the bottom sheet
    Navigator.pop(context);
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Upload Result',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              YMargin(50),
              Center(
                child: GestureDetector(
                  onTap: () {
                    openImagePickerModal(context);
                  },
                  child: Container(
                    width: 180,
                    height: 180,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: _imageFile != null
                                  ? FileImage(_imageFile)
                                  : AssetImage('assets/logodp.png'),
                              fit: BoxFit.contain,
                            ),
                            border: Border.all(color: Colors.deepPurple[700]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(child: Text("Note: All files must be jpeg/jpg")),
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
                            controller: _studentName,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                // errorBorder: ,
                                disabledBorder: InputBorder.none,
                                labelText: 'StudentName',
                                labelStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: 'StudentName'),
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
                            controller: _term,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                // errorBorder: ,
                                disabledBorder: InputBorder.none,
                                labelText: 'Term',
                                labelStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: 'Term'),
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
              YMargin(30),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.deepPurple[700],
                    onPressed: () {
                      ResultRequests().uploadresult(_studentName.text,
                          _class.text, _term.text, _imageFile, context);
                    },
                    child: Text("Upload Result",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Metropolis')),
                  ),
                ),
              ),
              YMargin(10)
            ],
          ),
        ));
  }
}

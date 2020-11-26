import 'package:dpis_app/Notes/requests.dart';
import 'package:dpis_app/Notes/viewnotes.dart';
import 'package:dpis_app/result/resultmodel.dart';
import 'package:dpis_app/staffhome.dart';
import 'package:dpis_app/toasts.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'Notes/notemodel.dart';
import 'results.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  String albumName = 'Media';

  Future<GetNotesModel> _future;
  @override
  void initState() {
    _future = NoteRequests().getnotesreq();
    super.initState();
  }

  // // ignore: unused_element
  // void _saveNetworkImage() async {
  //   String path = snaps
  //   GallerySaver.saveImage(path, albumName: albumName).then((bool success) {
  //     setState(() {
  //       print('Image is saved');
  //     });
  //   });
  // }

  Future<GetNotesModel> _getData() async {
    setState(() {
      _future = NoteRequests().getnotesreq();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'My Notes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.book_outlined,
                      color: Colors.deepPurple[900],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder<GetNotesModel>(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _future = NoteRequests().getnotesreq();
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
                            _future = NoteRequests().getnotesreq();
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
                                _future = NoteRequests().getnotesreq();
                              });
                            },
                            child: Text('Connection Problem, try again',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.data.notes.isEmpty) {
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
                                _future = NoteRequests().getnotesreq();
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
                          itemCount: snapshot.data.notes.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {
                                    String path =
                                        snapshot.data.notes[index].noteimg;
                                    GallerySaver.saveImage(path,
                                            albumName: albumName)
                                        .then((bool success) {
                                      setState(() {
                                        showToast(
                                            "${snapshot.data.notes[index].subject}, ${snapshot.data.notes[index].topic} Note Saved Sucessfully",
                                            Colors.green);
                                      });
                                    });
                                  },
                                  title: Text(
                                    snapshot.data.notes[index].subject,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data.notes[index].topic,
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

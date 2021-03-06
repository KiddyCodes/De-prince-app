import 'package:dpis_app/home.dart';
import 'package:dpis_app/result/resultmodel.dart';
import 'package:dpis_app/staffhome.dart';
import 'package:dpis_app/toasts.dart';
import 'package:dpis_app/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:dpis_app/result/resultreq.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gallery_saver/gallery_saver.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String albumName = 'Media';
  Future<GetResultModel> _future;
  @override
  void initState() {
    _future = ResultRequests().getresultreq();
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

  Future<GetResultModel> _getData() async {
    setState(() {
      _future = ResultRequests().getresultreq();
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
                      'My Results',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                XMargin(10),
                Column(
                  children: [
                    Icon(
                      Icons.assessment,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder<GetResultModel>(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _future = ResultRequests().getresultreq();
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
                            _future = ResultRequests().getresultreq();
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
                            color: Colors.deepPurple[700],
                            onPressed: () {
                              setState(() {
                                _future = ResultRequests().getresultreq();
                              });
                            },
                            child: Text('Connection Problem, try again',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.data.result.isEmpty) {
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
                                _future = ResultRequests().getresultreq();
                              });
                            },
                            child: Text(
                                'No result Available for ' +
                                    "${studentLoad.studentName}",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: _getData,
                      child: ListView.builder(
                          itemCount: snapshot.data.result.length,
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {
                                    String path =
                                        snapshot.data.result[index].resultimg;
                                    GallerySaver.saveImage(path,
                                            albumName: albumName)
                                        .then((bool success) {
                                      setState(() {
                                        showToast(
                                            "${snapshot.data.result[index].studentName}, ${snapshot.data.result[index].clss}, ${snapshot.data.result[index].term} Term Result Saved Sucessfully",
                                            Colors.green);
                                      });
                                    });
                                  },
                                  title: Text(
                                    snapshot.data.result[index].studentName,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data.result[index].clss} " +
                                        "${snapshot.data.result[index].term} Term " +
                                        " Result",
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

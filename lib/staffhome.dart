import 'package:dpis_app/Notes/addnotes.dart';
import 'package:dpis_app/drawer2_screen.dart';
import 'package:dpis_app/staff/staff_model.dart';
import 'package:dpis_app/student/sharedprf.dart';
import 'package:dpis_app/utils/margin.dart';
import 'package:flutter/material.dart';

import 'notification.dart';

StaffData staffLoad = StaffData();
var primcolor = Colors.red[700];

class StaffHome extends StatefulWidget {
  @override
  _StaffHomeState createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  loadSharedPrefs() async {
    try {
      StaffData staff =
          StaffData.fromJson(await SharedPref().read("staffData"));
      print("Data loaded");

      // Scaffold.of(context).showSnackBar(SnackBar(
      //     content: new Text("Loaded!"),
      //     duration: const Duration(milliseconds: 10)));
      setState(() {
        staffLoad = staff;
      });
    } catch (Excepetion) {
      print(Excepetion);
      // Scaffold.of(context).showSnackBar(SnackBar(
      //     content: new Text("Nothing found!"),
      //     duration: const Duration(milliseconds: 10)));
    }
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    loadSharedPrefs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer2Screen(),
        key: _scaffoldKey,
        body: Column(children: [
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.red[700],
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Column(
                      children: [
                        YMargin(40),
                        Row(
                          children: [
                            XMargin(160),
                            Text(
                              "${staffLoad.staffName} ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            XMargin(100),
                            CircleAvatar(
                              backgroundColor: Colors.red[700],
                              backgroundImage: NetworkImage(staffLoad.image),
                            ),
                          ],
                        ),
                      ],
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
                            onPressed: () {
                              print("your menu action here");
                              _scaffoldKey.currentState.openDrawer();
                            },
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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              childAspectRatio: 1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddNotes()));
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primcolor),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Column(children: [
                          YMargin(35),
                          Icon(Icons.note_add),
                          YMargin(10),
                          Text('Give Notes')
                        ]),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primcolor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(children: [
                        YMargin(35),
                        Icon(Icons.mail_outline),
                        YMargin(10),
                        Text('Meeting')
                      ]),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primcolor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(children: [
                        YMargin(35),
                        Icon(Icons.chat),
                        YMargin(10),
                        Text('Chat')
                      ]),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primcolor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(children: [
                        YMargin(35),
                        Icon(Icons.list),
                        YMargin(10),
                        Text('Logs')
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ]));
  }
}

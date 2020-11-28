import 'package:dpis_app/drawer2_screen.dart';
import 'package:dpis_app/drawer_screen.dart';
import 'package:dpis_app/notification.dart';
import 'package:dpis_app/student/sharedprf.dart';
import 'package:dpis_app/student/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

UserData studentLoad = UserData();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  loadSharedPrefs() async {
    try {
      UserData student = UserData.fromJson(await SharedPref().read("userData"));
      print("Data loaded");

      // Scaffold.of(context).showSnackBar(SnackBar(
      //     content: new Text("Loaded!"),
      //     duration: const Duration(milliseconds: 10)));
      setState(() {
        studentLoad = student;
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
      drawer: DrawerScreen(),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: true,
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Column(children: [
          ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 420,
                width: 500,
                color: Colors.deepPurple[900],
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(children: [
                                      IconButton(
                                        icon: Icon(Icons.menu,
                                            color: Colors.white),
                                        onPressed: () {
                                          print("your menu action here");
                                          _scaffoldKey.currentState
                                              .openDrawer();
                                        },
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 320),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Center(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.notifications,
                                                color: Colors.deepPurple[900],
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Notifications()));
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 150),
                                  child: Text(
                                    "Hi, ${studentLoad.studentName}",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Image.network("studentLoad.image"),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
              child: Opacity(
            opacity: 0.95,
            child: Container(
                width: 400,
                height: 400,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            color: Colors.grey[100]),
                        child: ListTile(
                          title: Text(
                            'Student Information',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.deepPurple[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 40,
                        child: ListTile(
                          title: Text('Name:'),
                          trailing: Text(' ${studentLoad.studentName}'),
                        ),
                      ),
                      Divider(
                        thickness: 0,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          width: 400,
                          height: 30,
                          child: ListTile(
                            title: Text('Class:'),
                            trailing: Text(' ${studentLoad.studentClass}'),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: 400,
                        height: 30,
                        child: ListTile(
                          title: Text('Course'),
                          trailing: Text(' ${studentLoad.studentCourse}'),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: 400,
                        height: 30,
                        child: ListTile(
                          title: Text('StudentId:'),
                          trailing: Text(' ${studentLoad.vcode}'),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: 400,
                        height: 30,
                        child: ListTile(
                          title: Text('Phone Number:'),
                          trailing: Text(' ${studentLoad.studentNumber}'),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: 400,
                        height: 30,
                        child: ListTile(
                          title: Text('Email:'),
                          trailing: Text(' ${studentLoad.studentEmail}'),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                )),
          )),
        )
      ])),
    );
  }
}

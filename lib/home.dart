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
          Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(children: <Widget>[
                ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 420,
                      width: 500,
                      color: Colors.deepPurple[900],
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Container(
                            child: Row(children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 20),
                                    child: Text(
                                      "Hi, ${studentLoad.studentName}",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  )),
                            ]),
                          ),
                        ),
                      ]),
                    )),
                Positioned(
                  top: 40.0,
                  left: 0.0,
                  right: MediaQuery.of(context).size.width / 1.39,
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
                              color: Colors.deepPurple[900],
                            ),
                            onPressed: () {
                              print("your menu action here");
                              _scaffoldKey.currentState.openDrawer();
                            },
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.deepPurple[900],
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
              ])
              // SizedBox(height: MediaQuery.of(context).size.height / 40),
              ),
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
        ]),
      ),
    );
  }
}

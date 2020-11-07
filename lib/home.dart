import 'package:dpis_app/drawer_screen.dart';
import 'package:dpis_app/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: true,
      key: _scaffoldKey,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: <Widget>[
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
                                        top: 30, left: 20),
                                    child: Text(
                                      "Hi, Marvellous",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

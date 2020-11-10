import 'package:dpis_app/home.dart';
import 'package:dpis_app/results.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'option_pg.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple[900]),
              accountName: Text("${studentLoad.studentName}"),
              currentAccountPicture: CircleAvatar(),
              accountEmail: Text("${studentLoad.studentEmail}")),
          DrawerListTile(
            iconData: Icons.receipt,
            title: 'View result',
            onTilePressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Results()));
            },
          ),
          DrawerListTile(
            iconData: Icons.announcement,
            title: 'Information',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.contact_phone,
            title: 'Contact Us',
            onTilePressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                  context: (context),
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "De-Prince International Schools",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Beside Eneka Civic Centre, Eneka",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Container(
                                  child: Image.asset('assets/logodp.png'),
                                  height: 80,
                                ),
                                SizedBox(height: 50),
                                Text(
                                  "Tel: ",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Tel:",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
          ),
          DrawerListTile(
            iconData: Icons.info_outline,
            title: 'About app',
            onTilePressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                  context: (context),
                  builder: (BuildContext) {
                    return Container(
                      height: 200,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "De-Prince International School App",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  "Built by Seeqzaza",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Container(
                                  child: Image.asset('assets/seeqmain.png'),
                                  height: 80,
                                ),
                                Text(
                                  "Visit us @: www.seeqzaza.com",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Contact us: divine@seeqzaza.com",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
          ),
          DrawerListTile(
            iconData: Icons.exit_to_app,
            title: 'Sign Out',
            onTilePressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              await sharedPreferences.clear();
              await sharedPreferences.remove("UserData");
              await sharedPreferences.setString("UserData", null);
              // setState(() {
              //   vendorLoad.vendorId = null;
              //   vendorLoad.vendorNumber = null;
              //   vendorLoad.vendorName = null;
              //   vendorLoad.vendorEmail = null;
              // });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) => Firstpg(),
                ),
              );
            },
          ),
          SizedBox(height: 260),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text("Version 1.0"),
              ))
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({Key key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
              accountName: Text('Marvellous Felix'),
              currentAccountPicture: CircleAvatar(),
              accountEmail: Text('DPIS022')),
          DrawerListTile(
            iconData: Icons.receipt,
            title: 'View result',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.announcement,
            title: 'Information',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.contact_phone,
            title: 'Contact Us',
            onTilePressed: () {},
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
                                  "Built & Powered by Seeqzaza",
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

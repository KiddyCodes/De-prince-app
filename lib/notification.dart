import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 10,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text("Notifications",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialog(context);
                              }),
                          title: Text('Mr Kenneth'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 15),
                          child: Text(
                            'Hello,i have updated ur jss1 results so u can go and view it',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('12:45')),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('Today')),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialog(context);
                              }),
                          title: Text('Mr Kalu'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 15),
                          child: Text(
                            'Hello,i have updated ur SS1 results so u can go and view it',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('12:45')),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('Yesterday')),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                 
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialog(context);
                              }),
                          title: Text('Mr Nathaniel'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 15),
                          child: Text(
                            'Hello,i have updated ur jss2 results so u can go and view it',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('12:45')),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('Last Week')),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialog(context);
                              }),
                          title: Text('Mr Raymond'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 15),
                          child: Text(
                            'Hello,i have updated ur SS2 results so u can go and view it',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('12:45')),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('Last Month')),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialog(context);
                              }),
                          title: Text('Mr Dalington'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 15),
                          child: Text(
                            'Hello,i have updated ur jss3 results so u can go and view it',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('11:30')),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('Last Month')),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: AlertDialog(
              title: Column(
                children: [
                  Text('Do you want to permanently delete this notification')
                ],
              ),
              actions: [
                Row(
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.deepPurple[900]),
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.deepPurple[900]),
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }
}

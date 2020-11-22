import 'package:flutter/material.dart';

class SS1 extends StatefulWidget {
  @override
  _SS1State createState() => _SS1State();
}

class _SS1State extends State<SS1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Card(
              child: Text("SS1 Results",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis")),
            )),
        SizedBox(
          height: 100,
        ),
        Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Card(
            elevation: 10,
            child: Center(
              child: Text('Mid Term Result',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis")),
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Card(
            elevation: 10,
            child: Center(
              child: Text('Full Term Result',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Metropolis")),
            ),
          ),
        )
      ],
    ));
  }
}

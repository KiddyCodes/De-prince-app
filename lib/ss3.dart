import 'package:flutter/material.dart';

class SS3 extends StatefulWidget {
  @override
  _SS3State createState() => _SS3State();
}

class _SS3State extends State<SS3> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SS3 Results',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis'),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.book), title: Text('Mid Term Result')),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), title: Text('Full Term Result')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[900],
        onTap: _onItemTapped,
      ),
    );
  }
}

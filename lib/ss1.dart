import 'package:flutter/material.dart';

class SS1 extends StatefulWidget {
  @override
  _SS1State createState() => _SS1State();
}

class _SS1State extends State<SS1> {
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
            'SS1 Results',
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

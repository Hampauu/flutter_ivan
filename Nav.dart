import 'package:flutter/material.dart';

void main() {
  runApp(AplikasiNavigasiBawah());
}

class AplikasiNavigasiBawah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HalamanDenganNavigasiBawah(),
    );
  }
}

class HalamanDenganNavigasiBawah extends StatefulWidget {
  @override
  _HalamanDenganNavigasiBawahState createState() =>
      _HalamanDenganNavigasiBawahState();
}

class _HalamanDenganNavigasiBawahState
    extends State<HalamanDenganNavigasiBawah> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HalamanUtama(),
    HalamanSearch(),
    HalamanProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HalamanSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text(
          'Search',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HalamanProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

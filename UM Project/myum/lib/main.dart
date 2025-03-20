import 'package:flutter/material.dart';

void main() {
  runApp(MyUm());
}

class MyUm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  @override
  _MyUmAppState createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Library', style: TextStyle(fontSize: 24))),
    Center(child: Text('Cafeteria', style: TextStyle(fontSize: 24))),
    Center(child: Text('Gym', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyUM - Multi Page App')),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'Library'),
          NavigationDestination(icon: Icon(Icons.restaurant), label: 'Cafeteria'),
          NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Gym'),
        ],
      ),
    );
  }
}

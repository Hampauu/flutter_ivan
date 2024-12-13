import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
      title: 'Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetDemoScreen(),
    );
  }
}

class WidgetDemoScreen extends StatefulWidget {
  @override
  _WidgetDemoScreenState createState() => _WidgetDemoScreenState();
}

class _WidgetDemoScreenState extends State<WidgetDemoScreen> {
  int counter = 0;
  bool isSwitchOn = false;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSwitchOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Widget Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Counter: $counter',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text('Increment Counter'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enable Feature:', style: TextStyle(fontSize: 16)),
                Switch(
                  value: isSwitchOn,
                  onChanged: toggleSwitch,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 100,
              color: Colors.blue[100],
              child: Center(
                child: Text(
                  'This is a Container widget',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

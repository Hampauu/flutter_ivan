import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutExample(),
    );
  }
}

class LayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('///Flutter Layout///'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    'Row Layout :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 2'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 3'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Column layout :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('1. She sell sheashell at the sea shore'),
                  Text('2. Betty bitter bought some butter'),
                ],
              ),
              SizedBox(height: 20),

              Text(
                    'Stack Layout :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              Stack(
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(
                        'Bottom layer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 50,
                    child: Container(
                      color: Colors.red[200],
                      padding: EdgeInsets.all(8),
                      child: Text('Top layer'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                    'Grid Layout :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              Container(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 10,
                  children: List.generate(6, (index) {
                    return Container(
                      color: Colors.amber,
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

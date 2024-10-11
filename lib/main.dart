import 'package:flutter/material.dart';
import 'act1.dart'; // Import Act1 page
import 'act2.dart'; // Import Act2 page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STACK withNU'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 96, 105, 237),
          fontSize: 24,
          fontFamily: 'Readex Pro',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to Stack withNU!',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color.fromARGB(255, 96, 105, 237),
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTile(
                      context,
                      'Stack Blocks',
                      'Dynamic Rows and Columns',
                      Icons.grid_3x3_outlined,
                      Color(0xFF5140A8),
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Act1()), // Navigate to Act1
                      ),
                    ),
                    _buildTile(
                      context,
                      'Lay it Out!',
                      'Dynamic Grid Layout Generator',
                      Icons.view_module_rounded,
                      Color(0xFF327568),
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Act2()), // Navigate to Act2
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Column(
              children: [
                Text(
                  'developed by',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color.fromARGB(255, 96, 105, 237),
                    fontSize: 10.0,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Brenley Robles',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color.fromARGB(255, 96, 105, 237),
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Custom tile builder to replicate the beautiful design
  Widget _buildTile(BuildContext context, String title, String description, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

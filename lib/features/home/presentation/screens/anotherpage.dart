import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

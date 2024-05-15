import 'package:flutter/material.dart';

class Thirdpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Text(
          'ThirdS page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PictureLoadingPage extends StatelessWidget {
  const PictureLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                      "assets/img/elogo.png", // Replace with your image URL
              height: 200, // Set the desired height
              width: 200, // Set the desired width
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Spacing between image and loading indicator
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PictureLoadingPage(),
  ));
}
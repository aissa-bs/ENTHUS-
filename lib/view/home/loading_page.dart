import 'package:flutter/material.dart';

class PictureLoadingPage extends StatelessWidget {
  const PictureLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 255, 246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                      "assets/img/enthusp.png", // Replace with your image URL
              height: 250, // Set the desired height
              width: 250, // Set the desired width
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Spacing between image and loading indicator
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 161, 105, 250), 
            ),
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
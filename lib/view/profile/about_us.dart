import 'package:flutter/material.dart';
import 'package:fitness/common/colo_extension.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: TColor.white,
        foregroundColor: TColor.black,
        elevation: 0,
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              const SizedBox(height: 16),
              _buildDescriptionBox(
                title: "About Enthus",
                description:
                    "Enthus is a company that specializes in fitness and wellness solutions. Our mission is to empower individuals to live healthier and happier lives through innovative technology and personalized experiences.",
              ),
              const SizedBox(height: 16),
              _buildDescriptionBox(
                title: "About Enthus App",
                description:
                    "The Enthus app is designed to help users achieve their fitness goals by providing personalized workout plans, nutrition tracking, and progress monitoring. With Enthus, you can take control of your health and fitness journey.",
              ),
              const SizedBox(height: 16),
              _buildInfoBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        "assets/img/elogo.png",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _buildDescriptionBox({required String title, required String description}) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColor.primaryColor6,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: TColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enthus Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColor.primaryColor6,
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoItem("Location", "chlef centre, Chlef, Algerie"),
            _buildInfoItem("Contact", "0794834084 | enthusalgerie@gmail.com"),
            _buildInfoItem("Website", "www.enthus.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title + ": ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: TColor.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: TColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
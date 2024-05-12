import 'package:flutter/material.dart';
import 'package:fitness/common/colo_extension.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
              color: TColor.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              content:
                  "Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect from you across our website and app.",
            ),
            SizedBox(height: 16),
            _buildSection(
              icon: Icons.data_usage,
              title: "Data Collection",
              content:
                  "We collect information from you when you register on our site, place an order, subscribe to a newsletter, respond to a survey or fill out a form.",
            ),
            SizedBox(height: 16),
            _buildSection(
              icon: Icons.share,
              title: "Data Sharing",
              content:
                  "We do not share personal information with third parties unless explicitly required by law.",
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: TColor.primaryColor1,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: TColor.primaryColor1,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 16, color: TColor.black),
        ),
      ],
    );
  }
}
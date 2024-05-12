import 'package:flutter/material.dart';
import 'package:fitness/common/colo_extension.dart';

class ContactUsView extends StatelessWidget {
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
          "Contact Us",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/img/contactus.png",
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                "Have any questions or feedback?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Feel free to contact us!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              const ContactRow(
                imagePath: "assets/img/email.png",
                text: "enthuscompany@gmail.com",
              ),
              const SizedBox(height: 15),
              const ContactRow(
                imagePath: "assets/img/phone.png",
                text: "+213794834084",
              ),
              const SizedBox(height: 15),
              const ContactRow(
                imagePath: "assets/img/website.png",
                text: "www.Enthus.com",
              ),
              const SizedBox(height: 15),
              const ContactRow(
                imagePath: "assets/img/facebook.png",
                text: "facebook.com/Enthus Algeria",
              ),
              const SizedBox(height: 15),
              const ContactRow(
                imagePath: "assets/img/instagram.png",
                text: "instagram.com/enthus.dz",
              ),
              const SizedBox(height: 15),
              const ContactRow(
                imagePath: "assets/img/linkedin.png",
                text: "linkedin.com/enthus.dz",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final String imagePath;
  final String text;

  const ContactRow({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 24,
          height: 24,
          color: TColor.black,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
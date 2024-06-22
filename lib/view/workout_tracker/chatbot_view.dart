import 'package:fitness/services/gpt_services/chatbot_service.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _disabilityController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  String _fitnessPlan = '';

  void _generateFitnessPlan() async {
    try {
      String weight = _weightController.text;
      String height = _heightController.text;
      String age = _ageController.text;
      String health = _healthController.text;
      String disability = _disabilityController.text;
      String goal = _goalController.text;

      String fitnessPlan = await ChatbotService.generateFitnessPlan(
        weight: weight,
        height: height,
        age: age,
        health: health,
        disability: disability,
        goal: goal,
      );

      setState(() {
        _fitnessPlan = fitnessPlan;
      });
    } catch (e) {
      setState(() {
        _fitnessPlan = 'Failed to generate fitness plan';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Chatbot'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age (years)'),
            ),
            TextField(
              controller: _healthController,
              decoration: InputDecoration(labelText: 'Health Conditions'),
            ),
            TextField(
              controller: _disabilityController,
              decoration: InputDecoration(labelText: 'Disabilities'),
            ),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(labelText: 'Goals'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateFitnessPlan,
              child: Text('Generate Fitness Plan'),
            ),
            SizedBox(height: 20),
            Text(_fitnessPlan),
          ],
        ),
      ),
    );
  }
}

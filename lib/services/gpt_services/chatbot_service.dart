import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static const String _apiUrl = 'http://<0.0.0.0>:5000/generate'; // Replace with your server's IP and port

  static Future<String> generateFitnessPlan({
    required String weight,
    required String height,
    required String age,
    required String health,
    required String disability,
    required String goal,
  }) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': 'Create a fitness plan for a user with the following details:\n'
                  'Weight: $weight kg\n'
                  'Height: $height cm\n'
                  'Age: $age years\n'
                  'Health conditions: $health\n'
                  'Disabilities: $disability\n'
                  'Goals: $goal\n'
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['response'].toString();
    } else {
      print('Error: ${response.statusCode} ${response.reasonPhrase}');
      print('Response body: ${response.body}');
      throw Exception('Failed to generate fitness plan');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.0.103:8000/api";

  static Future<Map<String, dynamic>> fetchNasaImage(String date, String coordinates) async {
    final url = Uri.parse('$baseUrl/cosmic-time-machine/fetch_nasa_image/?date=$date&coordinates=$coordinates');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch NASA image');
    }
  }

  static Future<void> postMessage(String userName, String message, String date, String coordinates) async {
    final url = Uri.parse('$baseUrl/cosmic-time-machine/');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_name": userName,
        "message": message,
        "observation_date": date,
        "sky_coordinates": coordinates,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post message');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class AmadeusApi {
  static const String apiKey = 'ALjH4iHzDb8SFfIPor2uApluri8xEHjr';
  static const String baseUrl = 'https://api.amadeus.com/v1';

  static Future<List<String>> fetchDestinations() async {
    final response = await http.get(
      Uri.parse('$baseUrl/locations/airports'),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<String> destinations = List<String>.from(data.map((destination) => destination['name']));
      return destinations;
    } else {
      throw Exception('Failed to fetch destinations: ${response.statusCode}');
    }
  }

  static Future<String> fetchDestinationDetail(String destination) async {
    final response = await http.get(
      Uri.parse('$baseUrl/location/$destination'),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String detail = data['description'] ?? 'Description not available';
      return detail;
    } else {
      throw Exception('Failed to fetch destination detail: ${response.statusCode}');
    }
  }

  static Future<String> fetchDestinationDescription(String destinationName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/location/$destinationName'),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String description = data['description'] ?? 'Description not available';
      return description;
    } else {
      throw Exception('Failed to fetch destination description: ${response.statusCode}');
    }
  }
}
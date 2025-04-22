// blog_service.dart
import 'dart:convert';
import 'package:doch_app/services/BlogModel.dart';
import 'package:http/http.dart' as http;

class BlogService {
  static const String baseUrl = 'http://192.168.1.234:8000/api';
  // static const String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List<BlogModel>> getBlogs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/blogs'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> blogsJson = data['blogs'];

        return blogsJson.map((json) => BlogModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blogs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}

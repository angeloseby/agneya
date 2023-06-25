import 'dart:convert';
import 'package:agneya/screens/courses/connection/courses_model.dart';
import 'package:http/http.dart' as http;

class CoursesApi {
  static Future<List<Courses>> getCourses() async {
    const url =
        "https://raw.githubusercontent.com/agneya2022/agneya/main/courses.json";

    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return body.map<Courses>(Courses.fromJson).toList();
  }
}

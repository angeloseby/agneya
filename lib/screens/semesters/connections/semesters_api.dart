import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:agneya/screens/semesters/connections/semesters_model.dart';

class SemestersApi {
  static Future<List<Semesters>> getPapers(String courseCode) async {
    print('called getPapers');
    final url =
        "https://raw.githubusercontent.com/agneya2022/agneya/main/papers/$courseCode.json";

    final response = await http.get(Uri.parse(url));

    // final body = json.decode(response.body);
    // return body.map<Semesters>(Semesters.fromJson).toList();

    try {
      final body = json.decode(response.body);
      List<Semesters> semestersList = (body as List)
          .map((semester) => Semesters.fromJson(semester))
          .toList();
      return semestersList;
    } catch (e) {
      print('Error decoding JSON: $e');
      return [];
    }
  }

  static Future<int> getSemesters(String courseCode) async {
    List<Semesters> semesters = await getPapers(courseCode);
    List<int> sem = [];
    for (Semesters s in semesters) {
      if (!sem.contains(s.semester)) {
        sem.add(s.semester!);
      }
    }
    return sem.length;
  }
}

import 'dart:convert';

import 'package:agneya/screens/university_updates/university_update_model.dart';
import 'package:http/http.dart' as http;

class UniversityUpdateApi {
  static Future<List<UniversityUpdate>> getCollegeUpdates() async {
    const url =
        "https://raw.githubusercontent.com/agneya2022/agneya/main/university_updates.json";

    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return body.map<UniversityUpdate>(UniversityUpdate.fromJson).toList();
  }
}

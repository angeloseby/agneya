import 'dart:convert';

import 'package:agneya/screens/placement_desk/placement_desk_model.dart';
import 'package:http/http.dart' as http;

class PlacementDeskApi {
  static Future<List<PlacementDesk>> getCollegeUpdates() async {
    const url =
        "https://raw.githubusercontent.com/agneya2022/agneya/main/placement_desk.json";

    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return body.map<PlacementDesk>(PlacementDesk.fromJson).toList();
  }
}

import 'dart:convert';
import 'package:agneya/screens/home/connection/scroll_model.dart';
import 'package:http/http.dart' as http;

class ScrollApi {
  static Future<List<Scroll>> getScrolls() async {
    const url =
        "https://raw.githubusercontent.com/agneya2022/agneya/main/scrolls.json";

    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return body.map<Scroll>(Scroll.fromJson).toList();
  }
}

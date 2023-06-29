import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PdfApi{
  static Future<File> loadPdfFromNetwork(String url) async{
    final response = await http.get(Uri.parse(_urlPreprocessor(url)));
    final bytes = response.bodyBytes;
    return _storeFile(url,bytes);
  }

  static Future<File> _storeFile(String url,List<int> bytes) async{
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$fileName");
    await file.writeAsBytes(bytes,flush: true);
    return file;
  }

  static String _urlPreprocessor(String url){
    RegExp regExp = RegExp(r'/d/([a-zA-Z0-9_-]+)');
    Match? match = regExp.firstMatch(url);
    final String? id = match?.group(1)!;
    final String downloadUrl = 'https://drive.google.com/uc?export=view&id=$id';
    return downloadUrl;
  }

}
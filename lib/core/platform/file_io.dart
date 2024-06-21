import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileIO {
  Future<void> downloadAcsmFile(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
      print('File downloaded to ${file.path}');
    } else {
      throw Exception('Failed to download file');
    }
  }

  Future<List<int>> readFile(String filename) async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/$filename');
    final data = await file.readAsBytes();
    return data;
  }
}

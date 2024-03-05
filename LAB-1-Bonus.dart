import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
void main() async {
  List<String> urls = [
    'https://example.com/file1.zip',
    'https://example.com/file2.zip',
    'https://example.com/file3.zip',
  ];
  await downloadFilesConcurrently(urls);
}
Future<void> downloadFilesConcurrently(List<String> urls) async {
  List<Future<void>> downloadFutures = [];
  for (String url in urls) {
    downloadFutures.add(downloadFile(url));
  }
  await Future.wait(downloadFutures);
  print('All downloads completed!');
}
Future<void> downloadFile(String url) async {
  final fileName = url.split('/').last;
  File file = File(fileName);
  try {
    final response = await http.get(Uri.parse(url), onReceiveProgress: (int received, int total) {
      double progress = received / total * 100;
      print('$fileName: ${progress.toStringAsFixed(2)}% downloaded');
    });
    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes);
      print('$fileName downloaded successfully');
    } else {
      throw Exception('Failed to download $fileName. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading $fileName: $e');
  }
}

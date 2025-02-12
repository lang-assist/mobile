import 'dart:typed_data';
import 'package:http/http.dart';

Future<Uint8List> getAudio(String path) async {
  final res = await get(Uri.parse(path));
  if (res.statusCode != 200) {
    throw Exception("Failed to fetch audio");
  }
  return res.bodyBytes;
}

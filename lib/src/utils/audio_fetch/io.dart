import 'dart:typed_data';
import 'dart:io';

Future<Uint8List> getAudio(String path) async {
  return File(path).readAsBytesSync();
}

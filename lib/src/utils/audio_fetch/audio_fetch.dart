import 'dart:typed_data';

import 'stub.dart'
    if (dart.library.io) 'io.dart'
    if (dart.library.html) 'web.dart'
    show getAudio;

Future<Uint8List> fetchAudio(String path) async {
  return getAudio(path);
}

import 'package:xml/xml.dart';

// recursive function to get the text from the ssml
String _getVoiceText(XmlNode element) {
  final buffer = StringBuffer();

  if (element is XmlText) {
    buffer.write(element.value);
  } else {
    for (final child in element.children) {
      buffer.write(_getVoiceText(child));
      buffer.write(' ');
    }
  }

  return buffer.toString();
}

String getTextFromSsml(String ssml) {
  final document = XmlDocument.parse(ssml);

  final buffer = StringBuffer();

  for (final element in document.findElements('voice')) {
    buffer.write(_getVoiceText(element));
    buffer.write(' ');
  }

  return buffer.toString();
}

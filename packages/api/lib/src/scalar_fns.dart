part of '../api.dart';

DateTime dateTimeFromJson(int value) {
  return DateTime.fromMillisecondsSinceEpoch(value);
}

int dateTimeToJson(DateTime value) {
  return value.millisecondsSinceEpoch;
}

dynamic jsonFromString(String value) {
  return jsonDecode(value);
}

List<dynamic> jsonListFromString(String value) {
  return jsonDecode(value);
}

String jsonToString(dynamic value) {
  return jsonEncode(value);
}

String jsonListToString(List<dynamic> value) {
  return jsonEncode(value);
}

Avatar avatarFromJson(String value) {
  return Avatar.fromString(value);
}

String avatarToJson(Avatar value) {
  return value.value;
}

Uint8List base64DataFromJson(String value) {
  return base64Decode(value);
}

String base64DataToJson(Uint8List value) {
  return base64Encode(value);
}

LinguisticUnitSet linguisticUnitSetFromJson(String value) {
  return LinguisticUnitSet.fromJson(jsonDecode(value));
}

String linguisticUnitSetToJson(LinguisticUnitSet value) {
  return jsonListToString(value.toJson());
}

LinguisticUnit linguisticUnitFromJson(Map<String, dynamic> value) {
  return LinguisticUnit.fromJson(value);
}

Map<String, dynamic> linguisticUnitToJson(LinguisticUnit value) {
  return value.toJson();
}

part of '../api.dart';

class Avatar {
  Avatar({
    String? value,
    Uint8List? data,
    this.mimeType,
    this.encoding,
    this.fileName,
  }) : _value = value,
       _data = data,
       assert(
         value != null || data != null,
         "Either value or data must be provided",
       ),
       assert(
         data == null || mimeType != null,
         "Mime type must be provided if data is provided",
       );

  Avatar.fromData(
    Uint8List data,
    String this.mimeType, {
    this.encoding,
    this.fileName,
  }) : _data = data,
       _value = null;

  Avatar.fromColors(List<Color> colors)
    : _value = colors.join(","),
      _data = null,
      mimeType = null,
      encoding = null,
      fileName = null;

  Avatar.fromString(String value)
    : _value = value,
      _data = null,
      mimeType = null,
      encoding = null,
      fileName = null;

  final String? _value;
  final Uint8List? _data;
  final String? mimeType;
  final String? encoding;
  final String? fileName;

  bool get isData => _data != null;

  bool get isColors => _value != null && _value.contains(",");

  List<Color> get hslColors {
    if (!isColors) {
      throw Exception("Avatar is not colors");
    }

    return _value!.split(",").map(int.parse).map((e) {
      return HSLColor.fromAHSL(1, e.toDouble(), 0.75, 0.5).toColor();
    }).toList();
  }

  String get value => _value!;

  Uint8List get data => _data!;

  @override
  String toString() => isData ? _data!.hashCode.toString() : value;

  // Input$UploadingHsl? get asHslInput {
  //   if (!isColors) {
  //     return null;
  //   }

  //   return Input$UploadingHsl(hsl: value);
  // }

  // Input$Upload? get asDataInput {
  //   if (!isData) {
  //     return null;
  //   }

  //   return Input$Upload(
  //     filename: _fileName,
  //     encoding: _encoding,
  //     data: data,
  //     mimeType: _mimeType!,
  //   );
  // }
}

Future<T> throwIfException<T>(Future<QueryResult<T>> ftr) async {
  final res = await ftr;
  if (res.hasException) {
    if (res.exception!.graphqlErrors.isEmpty) {
      logger.e("UNDEFINED ERROR: ${res.exception}");
      throw GraphQLError(message: "undefined_error");
    }
    throw res.exception!.graphqlErrors.first;
  }
  return res.parsedData as T;
}

T throwIfNull<T>(T? value) {
  if (value == null) {
    throw GraphQLError(message: "not_found");
  }
  return value;
}

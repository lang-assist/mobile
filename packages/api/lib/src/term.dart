// ignore_for_file: constant_identifier_names
part of '../api.dart';

class UnitDoc {
  String? title, search;
  UnitDoc(this.title, this.search);

  factory UnitDoc.fromJson(Map<String, dynamic> json) {
    return UnitDoc(json['title'], json['search']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'search': search};
  }
}

class UnipProp {
  String? key, value;
  UnitDoc? doc;
  bool? dict;

  UnipProp(this.key, this.value, this.doc, this.dict);

  factory UnipProp.fromJson(Map<String, dynamic> json) {
    return UnipProp(
      json['key'],
      json['value'],
      json['doc'] != null ? UnitDoc.fromJson(json['doc']) : null,
      json['dict'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value, 'doc': doc?.toJson(), 'dict': dict};
  }
}

class LinguisticUnit {
  String text;
  List<LinguisticUnit>? subUnits;
  List<UnipProp>? props;
  String? blankId;
  FocusNode? focusNode;
  TextEditingController? controller;

  LinguisticUnit(
    this.text, {
    this.subUnits,
    this.props,
    this.blankId,
    this.focusNode,
    this.controller,
  });

  factory LinguisticUnit.fromJson(Map<String, dynamic> json) {
    return LinguisticUnit(
      json['text'],
      subUnits:
          json['subUnits'] != null
              ? (json['subUnits'] as List<dynamic>)
                  .map((e) => LinguisticUnit.fromJson(e))
                  .toList()
              : null,
      props:
          json['props'] != null
              ? (json['props'] as List<dynamic>)
                  .map((e) => UnipProp.fromJson(e))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'props': props?.map((e) => e.toJson()).toList(),
      'blankId': blankId,
      'subUnits': subUnits?.map((e) => e.toJson()).toList(),
    };
  }
}

class LinguisticUnitSet {
  List<LinguisticUnit> units;

  final bool resolved;

  LinguisticUnitSet(this.units, [this.resolved = true]);

  LinguisticUnitSet.unresolved(String text)
    : resolved = false,
      units = [LinguisticUnit(text)];

  factory LinguisticUnitSet.fromJson(dynamic json) {
    if (json is List) {
      return LinguisticUnitSet(
        json.map((e) => LinguisticUnit.fromJson(e)).toList(),
      );
    } else {
      return LinguisticUnitSet.unresolved(json);
    }
  }

  List<Map<String, dynamic>> toJson() {
    if (resolved) {
      return units.map((e) => e.toJson()).toList();
    } else {
      return [
        {"text": units[0].text},
      ];
    }
  }

  bool hasNext(int index) {
    return index < units.length - 1;
  }

  LinguisticUnit next(int index) {
    return units[index + 1];
  }

  static final punctuations = [
    ".",
    ",",
    "!",
    "?",
    ";",
    ":",
    "...",
    "\"",
    "'",
    "“",
    "”",
    "‘",
    "’",
  ];

  bool spaceRequired(int index) {
    if (hasNext(index)) {
      final nextUnit = next(index);
      if (punctuations.contains(nextUnit.text)) {
        return false;
      }
      return true;
    }
    return false;
  }

  String get normalized {
    final res = StringBuffer();
    for (var i = 0; i < units.length; i++) {
      res.write(units[i].text);
      if (spaceRequired(i)) {
        res.write(' ');
      }
    }
    return res.toString();
  }

  LinguisticUnitSet forBlankQuestion() {
    final txt = normalized;
    final regex = RegExp(r"\{([^}]+)\}");
    final parts = txt.split(" ");
    final res = <LinguisticUnit>[];
    for (final part in parts) {
      if (regex.hasMatch(part)) {
        final match = regex.firstMatch(part);
        final blankId = match?.group(1);
        res.add(
          LinguisticUnit(
            part,
            blankId: blankId,
            focusNode: FocusNode(),
            controller: TextEditingController(),
          ),
        );
      } else {
        res.add(LinguisticUnit(part));
      }
    }
    return LinguisticUnitSet(res);
  }
}

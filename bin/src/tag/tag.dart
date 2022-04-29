library tag;

import 'package:analyzer/source/line_info.dart';
export './directive_tag/directive_tag.dart';

part 'tag_kind.dart';

part 'tag_item.dart';

abstract class Tag {
  Tag({
    required String name,
    required this.filePath,
    required this.lineNumber,
    required this.address,
    required this.kind,
    this.directive,
    this.typeList,
  }) : _name = name;

  /// Name
  final String _name;

  String get name {
    final _blackList = [...kind.blackList(), "'", '"', ";"];
    String _res = _name;
    for (final b in _blackList) {
      _res = _res.replaceAll(b, "");
    }
    return _res;
  }

  final String filePath;

  /// LineNumber
  final int? lineNumber;

  String get lineNumberText {
    if (lineNumber == null) return "";
    return "line:$lineNumber";
  }

  /// Directive
  final String? directive;

  String? get directiveText {
    if (directive == null) return null;
    return "directive:$directive";
  }

  /// TypeList
  final List<String>? typeList;

  String? get typeText {
    if (typeList == null) return null;
    String _res = typeList!.join(" ");
    while (_res.contains("  ")) {
      _res = _res.replaceAll("  ", " ");
    }
    if (_res.isEmpty) return null;
    return "type:" + _res.trim();
  }

  final String address;

  final TagKind kind;

  static List<T> whereTypeList<T>(List list) {
    return list.whereType<T>().toList();
  }

  static int? getLineNumber(LineInfo? info, int offset) {
    if (info == null) return null;
    return info.getLocation(offset).lineNumber;
  }

  List<String> get tagComponent;

  String get toTag {
    return tagComponent.join("\t");
  }
}

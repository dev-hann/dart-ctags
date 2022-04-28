library tag;

import 'package:analyzer/source/line_info.dart';
import 'package:path/path.dart' as path;
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
  }) : _name = name;

  final String _name;
  final String filePath;
  final int? lineNumber;
  final String? directive;

  String get lineNumberText {
    if (lineNumber == null) return "";
    return "line:$lineNumber";
  }

  String get name {
    final _blackList = [...kind.blackList(), "'", '"', ";"];
    String _res = _name;
    for (final b in _blackList) {
      _res = _res.replaceAll(b, "");
    }
    return _res;
  }

  final String address;
  final TagKind kind;

  String get relativePath => path.relative(filePath, from: '.');

  static List<T> typeList<T>(List list) {
    return list.whereType<T>().toList();
  }

  static int? getLineNumber(LineInfo? info, int offset) {
    if (info == null) return null;
    return info.getLocation(offset).lineNumber;
  }

  String get toLine;
}

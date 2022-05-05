library tag;

import 'package:analyzer/source/line_info.dart';
export './directive_tag/directive_tag.dart';

part 'tag_kind.dart';

part 'tag_scope_kind.dart';

part 'extension/short_cut.dart';

/// for Contain kinds of [TagKind].
/// e.g. import [pub,dart,local] or class [variables,method]..
/// -{memberName}: {memberTag}
mixin MemberTagMixin on Tag {
  TagScopeKind get memberTag;

  String get memberName;

  String get childText => '${memberTag.toValue()}:$memberName';

  @override
  List<String> get tagComponent => super.tagComponent..add(childText);
}

mixin NameFilterMixin on Tag {
  String get filteredName {
    final _blackList = [...kind.blackList(), "'", '"', ";"];
    String _res = name;
    for (final b in _blackList) {
      _res = _res.replaceAll(b, "");
    }
    return _res.trim();
  }

  @override
  List<String> get tagComponent => super.tagComponent..[0] = filteredName;
}

/// {name}{signature}: {type}
abstract class Tag {
  Tag({
    required this.name,
    required this.filePath,
    required this.lineNumber,
    required this.kind,
  });

  final String name;

  final String filePath;

  final int? lineNumber;

  String get lineNumberText {
    if (lineNumber == null) return "";
    return "line:$lineNumber";
  }

  final String _address = '/^;"';

  final TagKind kind;

  List<String> get tagComponent =>
      [name, filePath, _address, kind.toValue(), lineNumberText];

  String get toLine {
    return tagComponent.join("\t");
  }

  static List<T> whereTypeList<T>(List list) {
    return list.whereType<T>().toList();
  }

  static int? getLineNumber(LineInfo? info, int offset) {
    if (info == null) return null;
    return info.getLocation(offset).lineNumber;
  }

  static String join(List<String?> list) {
    String _res = "";
    for (final item in list) {
      if (item == null) continue;
      _res += ' $item';
    }
    return _res.trim().replaceAll("  ", " ");
  }
}

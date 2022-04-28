library tag;

import 'package:analyzer/source/line_info.dart';
import 'package:path/path.dart' as path;
export './directive_tag/directive_tag.dart';

part 'tag_kind.dart';

part 'tag_item.dart';

abstract class Tag {
  Tag({
    required this.filePath,
    required this.itemList,
  });

  final String filePath;
  final List<TagItem> itemList;
  String get relativePath => path.relative(filePath, from: '.');

  static List<T> typeList<T>(List list) {
    return list.whereType<T>().toList();
  }

  static int? getLineNumber(LineInfo? info, int offset) {
    if (info == null) return null;
    return info.getLocation(offset).lineNumber;
  }

  List<String> toLines() {
    final List<String> _res = [];
    for (final item in itemList) {
      final line = item.toLine();
      _res.add(line);
    }
    return _res;
  }
}

library tag;

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

  List<String> toLines() {
    final List<String> _res = [];
    for (final item in itemList) {
      final line = item.toLine();
      _res.add(line);
    }
    return _res;
  }
}

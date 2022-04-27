library tag;

import 'package:analyzer/dart/ast/ast.dart';

export './directive_tag/directive_tag.dart';

part 'tag_kind.dart';

part 'import_tag_item.dart';

part 'tag_item.dart';

abstract class Tag {
  Tag({
    required this.kind,
  }) {
    initItemList();
  }

  final TagKind kind;
  final List<TagItem> itemList = [];

  void initItemList();

  List<String> toLines() {
    final List<String> _res = [];
    for (final item in itemList) {
      final line = item.toLine();
      _res.add(line);
    }
    return _res;
  }

  static List<Tag> fromUnit(CompilationUnit uni) {
    final List<Tag> _directiveTagList = [];
    return _directiveTagList;
  }
}

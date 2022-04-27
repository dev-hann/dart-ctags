library tag;

import 'package:analyzer/dart/ast/ast.dart';

part 'tag_kind.dart';

part './import_tag/import_tag.dart';
part './import_tag/import_tag_item.dart';
part 'library_tag.dart';
part 'tag_item.dart';

abstract class Tag {
  Tag(this.unit) {
    if (unit != null) {
      init(unit!);
    }
  }
  final CompilationUnit? unit;
  final List<TagItem> itemList = [];

  String get headLine;

  void init(CompilationUnit unit);

  String lines() {
    final List<String> _res = [headLine, ...itemList.map((e) => e.toLine())];
    return _res.join("\n");
  }
}

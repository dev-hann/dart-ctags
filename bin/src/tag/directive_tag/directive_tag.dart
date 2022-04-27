library directive_tag;

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';
import 'src/import_tag_item.dart';
import 'src/library_tag_item.dart';
import 'src/part_of_tag_item.dart';
import 'src/part_tag_item.dart';

part 'src/import_tag.dart';

part 'src/library_tag.dart';

part 'src/part_of_tag.dart';

part 'src/part_tag.dart';

abstract class DirectiveTag extends Tag {
  DirectiveTag({
    required TagKind kind,
    required String filePath,
  }) : super(
          kind: kind,
          filePath: filePath,
        );

  String replaceAllQuotes(String target) {
    return target.replaceAll("'", "").replaceAll('"', "");
  }

  static List<T> _directiveTypeList<T extends Directive>(
      List<Directive> directiveList) {
    return directiveList.whereType<T>().toList();
  }

  static List<DirectiveTag> fromDirective(
    List<Directive> directiveList,
    String filePath,
  ) {
    final List<DirectiveTag> _res = [];
    final libList = _directiveTypeList<LibraryDirective>(directiveList);
    if (libList.isNotEmpty) {
      final name =
          libList.first.childEntities.map((e) => e.toString()).toList();
      final _tag = LibraryTag(nameList: name, filePath: filePath);
      _res.add(_tag);
    }
    final impList = _directiveTypeList<ImportDirective>(directiveList);
    if (impList.isNotEmpty) {
      final _list = impList
          .map((e) => e.childEntities.map((e) => e.toString()).toList())
          .toList();
      final _tag = ImportTag(importList: _list, filePath: filePath);
      _res.add(_tag);
    }

    final partList = _directiveTypeList<PartDirective>(directiveList);
    if (partList.isNotEmpty) {
      final _list = partList
          .map((e) => e.childEntities.map((e) => e.toString()).toList())
          .toList();
      final _tag = PartTag(partList: _list, filePath: filePath);
      _res.add(_tag);
    }
    final partOfList = _directiveTypeList<PartOfDirective>(directiveList);
    if (partOfList.isNotEmpty) {
      final _list = partOfList
          .map((e) => e.childEntities.map((e) => e.toString()).toList())
          .toList();
      final _tag = PartOfTag(partList: _list, filePath: filePath);
      _res.add(_tag);
    }
    return _res;
  }
}

library directive_tag;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/source/line_info.dart';

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
    required List<TagItem> itemList,
    required String filePath,
  }) : super(
          filePath: filePath,
          itemList: itemList,
        );

  static List<DirectiveTag> fromDirective(
    List<Directive> directiveList,
    String filePath,
    LineInfo? lineInfo,
  ) {
    final List<DirectiveTag> _res = [];
    final libList = Tag.typeList<LibraryDirective>(directiveList);
    if (libList.isNotEmpty) {
      final lib = directiveList.first;
      final _tag = LibraryTag(
        name: lib.childEntities.map((e) => e.toString()).toList(),
        filePath: filePath,
        lineNumber: Tag.getLineNumber(lineInfo, lib.offset),
      );
      _res.add(_tag);
    }

    final impList = Tag.typeList<ImportDirective>(directiveList);
    if (impList.isNotEmpty) {
      final itemList = <ImportTagItem>[];

      for (final d in impList) {
        final item = ImportTagItem(
          name: d.childEntities.map((e) => e.toString()).toList(),
          filePath: filePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        itemList.add(item);
      }

      final _tag = ImportTag(itemList: itemList, filePath: filePath);
      _res.add(_tag);
    }

    final partList = Tag.typeList<PartDirective>(directiveList);
    if (partList.isNotEmpty) {
      final itemList = <PartTagItem>[];
      for (final d in partList) {
        final item = PartTagItem(
          name: d.childEntities.map((e) => e.toString()).toList(),
          filePath: filePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        itemList.add(item);
      }
      final _tag = PartTag(itemList: itemList, filePath: filePath);
      _res.add(_tag);
    }

    final partOfList = Tag.typeList<PartOfDirective>(directiveList);
    if (partOfList.isNotEmpty) {
      final itemList = <PartOfTagItem>[];
      for (final d in partOfList) {
        final item = PartOfTagItem(
          name: d.childEntities.map((e) => e.toString()).toList(),
          filePath: filePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        itemList.add(item);
      }
      final _tag = PartOfTag(itemList: itemList, filePath: filePath);
      _res.add(_tag);
    }
    return _res;
  }
}

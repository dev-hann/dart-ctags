library directive_tag;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/source/line_info.dart';

import '../tag.dart';

part 'src/import_tag.dart';

part 'src/library_tag.dart';

part 'src/part_of_tag.dart';

part 'src/part_tag.dart';

abstract class DirectiveTag extends Tag {
  DirectiveTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    String? directive,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: kind,
          directive: directive,
        );

  @override
  String get toLine {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      lineNumberText,
    ];


    if (directive != null) {
      _res.add("directive:$directive");
    }
    return _res.join("\t");
  }

  static List<DirectiveTag> fromDirective(
    List<Directive> directiveList,
    String filePath,
    LineInfo? lineInfo,
  ) {
    final List<DirectiveTag> _res = [];

    /// Library
    final libList = Tag.typeList<LibraryDirective>(directiveList);
    if (libList.isNotEmpty) {
      final lib = directiveList.first;
      final _tag = LibraryTag(
        name: lib.childEntities.join(""),
        filePath: filePath,
        lineNumber: Tag.getLineNumber(lineInfo, lib.offset),
      );
      _res.add(_tag);
    }

    /// Import
    final impList = Tag.typeList<ImportDirective>(directiveList);
    if (impList.isNotEmpty) {
      for (final d in impList) {
        final _tag = ImportTag(
          name: d.childEntities.join(""),
          filePath: filePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        _res.add(_tag);
      }
    }

    /// Part
    final partList = Tag.typeList<PartDirective>(directiveList);
    if (partList.isNotEmpty) {
      for (final d in partList) {
        final _tag = PartTag(
          name: d.childEntities.join(""),
          filePath: filePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        _res.add(_tag);
      }
    }

    /// part of
    final partOfList = Tag.typeList<PartOfDirective>(directiveList);
    if (partOfList.isNotEmpty) {
      for (final d in partOfList) {
        final _tag = PartOfTag(
            name: d.childEntities.join(""),
            filePath: filePath,
            lineNumber: Tag.getLineNumber(lineInfo, d.offset));
        _res.add(_tag);
      }
    }
    return _res;
  }
}

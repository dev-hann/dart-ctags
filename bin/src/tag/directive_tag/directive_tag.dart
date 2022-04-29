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
  List<String> get tagComponent {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      lineNumberText,
    ];

    if (directive != null) {
      _res.add(directiveText!);
    }
    return _res;
  }

  static List<DirectiveTag> fromDirective(
    List<Directive> directiveList,
    String filePath,
    LineInfo? lineInfo,
  ) {
    final List<DirectiveTag> _res = [];

    /// Library
    final libList = Tag.whereTypeList<LibraryDirective>(directiveList);
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
    final impList = Tag.whereTypeList<ImportDirective>(directiveList);
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
    final partList = Tag.whereTypeList<PartDirective>(directiveList);
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
    final partOfList = Tag.whereTypeList<PartOfDirective>(directiveList);
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

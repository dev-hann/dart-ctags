library declaration_tag;

import 'package:analyzer/source/line_info.dart';

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';

part 'src/klass_tag.dart';

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required List<TagItem> itemList,
    required String filePath,
  }) : super(
          itemList: itemList,
          filePath: filePath,
        );

  static fromDeclaration(
    NodeList<CompilationUnitMember> declarations,
    String relativePath,
    LineInfo? lineInfo,
  ) {
    for (final d in declarations) {
      print(d);
    }
  }
}

library declaration_tag;

import 'package:analyzer/source/line_info.dart';

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';

part 'src/klass_tag.dart';

part 'src/functions_tag.dart';

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String address,
    required TagKind kind,
    required String type,
  })  : _type = type,
        _access = name[0] == "_" ? "private" : "public",
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: address,
          kind: kind,
        );
  final String _access;
  final String _type;

  String get type => "type:$_type";

  String get access => "access:$_access";

  @override
  String get toLine {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      access,
      lineNumberText,
      type
    ];
    return _res.join("\t");
  }

  static List<DeclarationTag> fromDeclaration(
    NodeList<CompilationUnitMember> declarations,
    String relativePath,
    LineInfo? lineInfo,
  ) {
    final _res = <DeclarationTag>[];

    /// Class
    final klassList = Tag.typeList<ClassDeclaration>(declarations);
    if (klassList.isNotEmpty) {
      for (final d in klassList) {
        final _tag = KlassTag(
          name: d.name.name,
          filePath: relativePath,
          isAbstract: d.isAbstract,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
          extend: d.extendsClause.toString(),
          implement: d.implementsClause.toString(),
          withs: d.withClause.toString(),
        );

        _res.add(_tag);
      }
    }

    /// Functions
    final funcList = Tag.typeList<FunctionDeclaration>(declarations);
    if (funcList.isNotEmpty) {
      for (final d in funcList) {
        final _tag = FunctionsTag(
          name: d.name.name,
          filePath: relativePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
          type: d.returnType.toString(),
          parameters: d.functionExpression.parameters.toString(),
        );
        _res.add(_tag);
      }
    }

    return _res;
  }
}

library declaration_tag;

import 'package:analyzer/source/line_info.dart';

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';

part 'src/klass_tag.dart';

part 'src/functions_tag.dart';
part 'src/field_tag.dart';
part 'src/method_tag.dart';

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String address,
    required TagKind kind,
    required this.isAbstract,
    List<String>? typeList,
    String? directive,
  })  : _access = name[0] == "_" ? "private" : "public",
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: address,
          kind: kind,
          typeList: typeList,
          directive: directive,
        );
  final String _access;

  String get access => "access:$_access";
  final bool isAbstract;

  @override
  List<String> get tagComponent {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      access,
      lineNumberText,
    ];
    if (typeText != null) {
      String _type = typeText!;
      if (isAbstract) {
        _type = "Abstract" + _type;
      }
      _res.add(_type);
    }
    return _res;
  }

  static List<DeclarationTag> fromDeclaration(
    NodeList<CompilationUnitMember> declarations,
    String relativePath,
    LineInfo? lineInfo,
  ) {
    final _res = <DeclarationTag>[];

    /// Class
    final klassList = Tag.whereTypeList<ClassDeclaration>(declarations);
    if (klassList.isNotEmpty) {
      for (final d in klassList) {
        final _name = d.name.name;
        final _tag = KlassTag(
          name: _name,
          filePath: relativePath,
          isAbstract: d.isAbstract,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
          extend: d.extendsClause?.toString(),
          implement: d.implementsClause?.toString(),
          withs: d.withClause?.toString(),
          directive: _name,
        );
        _res.add(_tag);

        /// Member
        final memberList = d.members;

        /// Field
        // final fieldList = Tag.whereTypeList<FieldDeclaration>(memberList);
        // if (fieldList.isNotEmpty) {
        // for (final field in fieldList) {
        // final _f = field.fields;
        // final _type = _f.type?.toString();
        // final _keyword = _f.keyword?.toString();
        // final _name = _f.variables.map((e) => e.name.name).join("");
        // final _tag = FieldTag(
        // name: _name,
        // filePath: relativePath,
        // lineNumber: Tag.getLineNumber(lineInfo, field.offset),
        // keyword: _keyword,
        // type: _type,
        // );
        // _res.add(_tag);
        // }

        /// Method
        final methodList = Tag.whereTypeList<FunctionDeclaration>(memberList);
        if (memberList.isNotEmpty) {
          for (final m in memberList) {
            print(m.runtimeType);
            // final _tag = MethodTag(
            // );

            _res.add(_tag);
          }
        }
      }
    }

    /// Functions
    final funcList = Tag.whereTypeList<FunctionDeclaration>(declarations);
    if (funcList.isNotEmpty) {
      for (final d in funcList) {
        final _tag = FunctionsTag(
          name: d.name.name,
          filePath: relativePath,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
          isGetter: d.isGetter,
          isSetter: d.isSetter,
          type: d.returnType.toString(),
          parameters: d.functionExpression.parameters.toString(),
        );
        _res.add(_tag);
      }
    }
    return _res;
  }
}

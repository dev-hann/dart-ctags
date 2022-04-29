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
    required this.klass,
    required this.type,
    this.showAccess = true,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: address,
          kind: kind,
        );
  final String? klass;

  String get klassText {
    return "class:$klass";
  }

  final bool showAccess;

  String get accessText {
    final _access = name[0] == "_" ? "private" : "public";
    return "access:$_access";
  }

  final bool isAbstract;

  /// Type
  final String? type;

  String get typeText {
    String _type = type!;
    if (isAbstract) {
      _type = "Abstract $_type";
    }
    return "type:$_type";
  }

  @override
  List<String> get tagComponent {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      lineNumberText,
    ];
    if (type != null) {
      _res.add(typeText);
    }
    if (showAccess) {
      _res.add(accessText);
    }
    if (klass != null) {
      _res.add(klassText);
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
        final _className = d.name.name;
        final _classLineNumber = Tag.getLineNumber(lineInfo, d.offset);
        final _tag = KlassTag(
          name: _className,
          filePath: relativePath,
          isAbstract: d.isAbstract,
          lineNumber: Tag.getLineNumber(lineInfo, d.offset),
        );
        _res.add(_tag);
        if (d.extendsClause != null) {
          final name = d.extendsClause!.superclass.name.name;
          _res.add(
            KlassTag.extend(
              klass: _className,
              name: name,
              filePath: relativePath,
              lineNumber: _classLineNumber,
            ),
          );
        }

        if (d.implementsClause != null) {
          final name = d.implementsClause!.interfaces.join();
          _res.add(
            KlassTag.implement(
              klass: _className,
              name: name,
              filePath: relativePath,
              lineNumber: _classLineNumber,
            ),
          );
        }

        if (d.withClause != null) {
          final name = d.withClause!.mixinTypes.join();
          _res.add(
            KlassTag.withs(
              klass: _className,
              name: name,
              filePath: relativePath,
              lineNumber: _classLineNumber,
            ),
          );
        }

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
        final methodList = Tag.whereTypeList<MethodDeclaration>(memberList);
        if (memberList.isNotEmpty) {
          for (final m in methodList) {
            final _tag = MethodTag(
              name: m.name.name,
              filePath: relativePath,
              lineNumber: Tag.getLineNumber(lineInfo, m.offset),
              type: m.returnType?.toString(),
              isAbstract: m.isAbstract,
              isGetter: m.isGetter,
              isSetter: m.isSetter,
              parameters: m.parameters.toString(),
              klass: _className,
            );
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

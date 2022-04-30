library declaration_tag;

import 'package:analyzer/source/line_info.dart';

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';

part 'src/klass_tag.dart';

part 'src/functions_tag.dart';

part 'src/field_tag.dart';

part 'src/method_tag.dart';

part 'src/mixin_tag.dart';

/// extends or implement of klass , on of mixin.
abstract class TailTag extends Tag with MemberTagMixin {
  TailTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required this.memberName,
    required this.memberTag,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
        );

  @override
  final String memberName;
  @override
  TagScopeKind memberTag;
}

/// Klass or Mixin
abstract class HasTailTag extends DeclarationTag {
  HasTailTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required bool isAbstract,
    required String type,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          isAbstract: isAbstract,
          showAccess: true,
          type: type,
        );

  final List<TailTag> tailList = [];
  void addTail(TailTag tail) {
    tailList.add(tail);
  }

  @override
  String get toLine {
    String _res = super.toLine;
    for (final tail in tailList) {
      _res += '\n${tail.toLine}';
    }
    return _res;
  }
}

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required this.isAbstract,
    required this.type,
    required this.showAccess,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
        );

  final bool showAccess;

  String get accessText {
    final _access = name[0] == "_" ? "private" : "public";
    return "access:$_access";
  }

  final bool isAbstract;

  /// Type
  final String type;

  String get typeText {
    String _type = type;
    if (isAbstract) {
      _type = Tag.join(["Abstract", _type]);
    }
    return "type:$_type";
  }

  @override
  List<String> get tagComponent {
    final _res = super.tagComponent..add(typeText);

    if (showAccess) {
      _res.add(accessText);
    }

    return _res;
  }

  static List<DeclarationTag> fromDeclaration(
    NodeList<CompilationUnitMember> declarations,
    String relativePath,
    LineInfo? lineInfo,
  ) {
    final _res = <DeclarationTag>[];

    /// Mixin
    final mixinList = Tag.whereTypeList<MixinDeclaration>(declarations);
    if (mixinList.isNotEmpty) {
      for (final m in mixinList) {
        final _mixinName = m.name.name;
        final _lineNumber = Tag.getLineNumber(lineInfo, m.offset);
        final _tag = MxinTag(
          name: _mixinName,
          filePath: relativePath,
          lineNumber: _lineNumber,
        );
        final _onName = m.onClause?.superclassConstraints.join();
        if (_onName != null) {
          final _tail = MixinTailTag(
            name: _onName,
            filePath: relativePath,
            lineNumber: _lineNumber,
            mixinName: _mixinName,
            kind: TagKind.mixinOn,
          );
          _tag.addTail(_tail);
        }

        final implementsName = m.implementsClause?.interfaces.join();
        if (implementsName != null) {
          final _tail = MixinTailTag(
            name: _mixinName,
            filePath: relativePath,
            lineNumber: _lineNumber,
            mixinName: implementsName,
            kind: TagKind.implement,
          );
          _tag.addTail(_tail);
        }
        _res.add(_tag);
      }
    }

    /// Class
    final klassList = Tag.whereTypeList<ClassDeclaration>(declarations);
    if (klassList.isNotEmpty) {
      for (final d in klassList) {
        final _className = d.name.name;
        final _lineNumber = Tag.getLineNumber(lineInfo, d.offset);
        final _tag = KlassTag(
          name: _className,
          filePath: relativePath,
          isAbstract: d.isAbstract,
          lineNumber: _lineNumber,
          kind: TagKind.classes,
        );

        /// Check Extends
        final extendsName = d.extendsClause?.superclass.toSource();
        if (extendsName != null) {
          final _tailTag = KlassTailTag(
            name: extendsName,
            filePath: relativePath,
            lineNumber: _lineNumber,
            kind: TagKind.extend,
            klassName: _className,
          );
          _tag.addTail(_tailTag);
        }

        /// Check Implements
        final implementsName = d.implementsClause?.interfaces.join();
        if (implementsName != null) {
          final _tailTag = KlassTailTag(
            name: implementsName,
            filePath: relativePath,
            lineNumber: _lineNumber,
            kind: TagKind.implement,
            klassName: _className,
          );
          _tag.addTail(_tailTag);
        }

        /// Check With
        final withName = d.withClause?.mixinTypes.join();
        if (withName != null) {
          final _tailTag = KlassTailTag(
            name: withName,
            filePath: relativePath,
            lineNumber: _lineNumber,
            kind: TagKind.withs,
            klassName: _className,
          );
          _tag.addTail(_tailTag);
        }
        _res.add(_tag);

        /// Member
        final memberList = d.members;

        /// Field
        final fieldList = Tag.whereTypeList<FieldDeclaration>(memberList);
        if (fieldList.isNotEmpty) {
          for (final field in fieldList) {
            final _f = field.fields;
            final _type = _f.type?.toString();
            final _keyword = _f.keyword?.toString();
            final _name = _f.variables.map((e) => e.name.name).join("");
            final _tag = FieldTag(
                name: _name,
                filePath: relativePath,
                lineNumber: Tag.getLineNumber(lineInfo, field.offset),
                keyword: _keyword,
                type: _type,
                klassName: _className);
            _res.add(_tag);
          }
        }

        /// Method
        final methodList = Tag.whereTypeList<MethodDeclaration>(memberList);
        if (memberList.isNotEmpty) {
          for (final m in methodList) {
            print(m.declaredElement);
            final _tag = KlassMethodTag(
              name: m.name.name,
              filePath: relativePath,
              lineNumber: Tag.getLineNumber(lineInfo, m.offset),
              type: m.returnType?.toString(),
              isAbstract: m.isAbstract,
              isGetter: m.isGetter,
              isSetter: m.isSetter,
              parameters: m.parameters?.toString(),
              klassName: _className,
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

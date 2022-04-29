part of declaration_tag;

class KlassInheritedTag extends Tag with MemberTagMixin {
  KlassInheritedTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required this.klassName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
        );
  final String klassName;

  @override
  String get memberName => klassName;

  @override
  TagScopeKind get memberTag => TagScopeKind.klass;
}

abstract class KlassMemberTag extends DeclarationTag with MemberTagMixin {
  KlassMemberTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required bool isAbstract,
    required String type,
    required this.klassName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          isAbstract: isAbstract,
          type: type,
        );

  final String klassName;

  @override
  String get memberName => klassName;

  @override
  TagScopeKind get memberTag => TagScopeKind.klass;
}

class KlassTag extends DeclarationTag {
  KlassTag({
    required String name,
    required String filePath,
    required bool isAbstract,
    required int? lineNumber,
    required TagKind kind,
    bool? showAccess,
    required this.extendsName,
    required this.implementsName,
    required this.withName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          isAbstract: isAbstract,
          type: TagScopeKind.klass.toValue(),
          showAccess: showAccess ?? true,
        );
  final String? extendsName;

  String get extendsText {
    return KlassInheritedTag(
      name: extendsName!,
      filePath: filePath,
      lineNumber: lineNumber,
      kind: TagKind.extend,
      klassName: name,
    ).toLine;
  }

  final String? implementsName;

  String get implementsText {
    return KlassInheritedTag(
      name: implementsName!,
      filePath: filePath,
      lineNumber: lineNumber,
      kind: TagKind.implement,
      klassName: name,
    ).toLine;
  }

  final String? withName;

  String get withText {
    return KlassInheritedTag(
      name: withName!,
      filePath: filePath,
      lineNumber: lineNumber,
      kind: TagKind.withs,
      klassName: name,
    ).toLine;
  }

  @override
  String get toLine {
    String _res = super.toLine;
    if (extendsName != null) {
      _res += '\n$extendsText';
    }
    if (implementsName != null) {
      _res += '\n$implementsText';
    }
    if (withName != null) {
      _res += '\n$withText';
    }
    return _res;
  }
}

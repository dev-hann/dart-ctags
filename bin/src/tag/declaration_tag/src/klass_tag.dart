part of declaration_tag;


class KlassTag extends HasTailTag {
  KlassTag({
    required String name,
    required String filePath,
    required bool isAbstract,
    required int? lineNumber,
    required TagKind kind,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          isAbstract: isAbstract,
          type: TagScopeKind.klass.toValue(),
        );

}

class KlassTailTag extends TailTag {
  KlassTailTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required TagKind kind,
    required String klassName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          memberName: klassName,
          memberTag: TagScopeKind.klass,
        );
}

abstract class KlassMemberTag extends DeclarationTag with MemberTagMixin {
  final String klassName;

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
          showAccess: true,
        );

  @override
  String get memberName => klassName;

  @override
  TagScopeKind get memberTag => TagScopeKind.klass;
}

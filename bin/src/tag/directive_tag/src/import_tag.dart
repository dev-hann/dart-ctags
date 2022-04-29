part of directive_tag;

class ImportTag extends DirectiveTag with MemberTagMixin {
  ImportTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: importTagKind(name),
        );

  static TagKind importTagKind(String name) {
    if (name.contains("dart:")) return TagKind.dart;
    if (name.contains("package:")) return TagKind.pub;
    return TagKind.local;
  }

  @override
  TagScopeKind get memberTag => TagScopeKind.directive;

  @override
  String get memberName => "import";
}

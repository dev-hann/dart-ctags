part of directive_tag;

class ImportTag extends DirectiveTag {
  ImportTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: _importTagKind(name),
          directive: "import",
        );

  static TagKind _importTagKind(String name) {
    if (name.contains("dart:")) return TagKind.dart;
    if (name.contains("package:")) return TagKind.pub;
    return TagKind.local;
  }
}

part of tag;

class ImportTag extends Tag {
  ImportTag({
    required List<String> nameEntity,
    required String path,
    String? type,
  }) : super(
          nameEntity: nameEntity,
          path: path,
          kind: TagKind.imports,
          type: type ?? "directive:import",
        );

  @override
  TagKind get kind {
    final _name = name;
    if (_name == "import") {
      return TagKind.imports;
    }
    if (_name.contains("dart:")) {
      return TagKind.dart;
    } else if (_name.contains("package:")) {
      return TagKind.pub;
    }
    return TagKind.local;
  }

  @override
  String get filter => 'import';

  factory ImportTag.headLine(CompilationUnit unit) {
    return ImportTag(
      nameEntity: ["import"],
      path: '.',
      type: "type:directives",
    );
  }
}

part of directive_tag;

class PartTag extends DirectiveTag {
  PartTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: TagKind.part,
        );
}

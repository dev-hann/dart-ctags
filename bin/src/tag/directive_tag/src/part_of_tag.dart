part of directive_tag;

class PartOfTag extends DirectiveTag {
  PartOfTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: TagKind.partOf,
        );
}

part of directive_tag;

class LibraryTag extends DirectiveTag {
  LibraryTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: TagKind.library,
        );
}

part of directive_tag;

class LibraryTag extends DirectiveTag {
  LibraryTag({
    required List<String> name,
    required String filePath,
    required int? lineNumber,
  }) : super(
            filePath: filePath,
            itemList: [LibraryTagItem(name, filePath, lineNumber)]);
}

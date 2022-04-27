part of directive_tag;

class LibraryTag extends DirectiveTag {
  LibraryTag({
    required this.nameList,
    required String filePath,
  }) : super(
          kind: TagKind.library,
          filePath: filePath,
        );

  final List<String> nameList;

  @override
  List<TagItem> loadTagItem() {
    final _name = replaceAllQuotes(nameList[1]);
    return [LibraryTagItem(_name, relativePath)];
  }
}

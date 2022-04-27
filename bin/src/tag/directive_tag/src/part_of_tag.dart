part of directive_tag;

class PartOfTag extends DirectiveTag {
  PartOfTag({
    required this.partList,
    required String filePath,
  }) : super(
          kind: TagKind.part,
          filePath: filePath,
        );

  final List<List<String>> partList;

  @override
  List<TagItem> loadTagItem() {
    final _res = <TagItem>[];
    for (final import in partList) {
      final _name = replaceAllQuotes(import[2]);
      final item = PartOfTagItem(
        name: _name,
        filePath: filePath,
      );
      _res.add(item);
    }
    return _res;
  }
}

part of directive_tag;

class PartTag extends DirectiveTag {
  PartTag({
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
      final _name = replaceAllQuotes(import[1]);
      final item = PartTagItem(
        name: _name,
        filePath: filePath,
      );
      _res.add(item);
    }
    return _res;
  }
}

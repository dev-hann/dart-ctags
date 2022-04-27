part of directive_tag;

class ImportTag extends DirectiveTag {
  ImportTag({
    required this.importList,
    required String filePath,
  }) : super(
          kind: TagKind.imports,
          filePath: filePath,
        );
  final List<List<String>> importList;

  TagKind childKind(String import) {
    if (import.contains("dart:")) {
      return TagKind.dart;
    } else if (import.contains("package:")) {
      return TagKind.pub;
    }
    return TagKind.local;
  }

  @override
  List<TagItem> loadTagItem() {
    final _res = <TagItem>[];
    for (final import in importList) {
      final _name = replaceAllQuotes(import[1]);
      final item = ImportTagItem(
        name: _name,
        filePath: filePath,
        kind: childKind(import.join(" ")),
      );
      _res.add(item);
    }
    return _res;
  }
}

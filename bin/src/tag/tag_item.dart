part of tag;

abstract class TagItem {
  TagItem({
    required List<String> name,
    required this.filePath,
    required this.separator,
    required this.kind,
    required this.type,
    this.lineNumber,
  }) : _nameList = name;

  final List<String> _nameList;

  String get name {
    final _res = _nameList.where((e) {
      return e != ";" && !kind.blackList().contains(e);
    });
    return _res.join(" ").replaceAll('"', "").replaceAll("'", "");
  }

  final String filePath;
  final String separator;
  final TagKind kind;
  final String type;
  final int? lineNumber;

  String get lineNumberText {
    if (lineNumber == null) {
      return "";
    }
    return "line:$lineNumber";
  }

  List<String> get componentList;

  String toLine() {
    return componentList.join("\t");
  }
}

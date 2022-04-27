part of tag;

abstract class TagItem {
  TagItem({
    required this.name,
    required this.filePath,
    required this.separator,
    required this.kind,
    required this.type,
  });

  final String name;
  final String filePath;
  final String separator;
  final TagKind kind;
  final String type;

  List<String> get componentList;

  String toLine() {
    return componentList.join("\t");
  }
}

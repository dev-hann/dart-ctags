part of tag;

abstract class TagItem {
  TagItem({
    required this.name,
    required this.path,
    required this.seperator,
    required this.kind,
    required this.type,
  });
  final String name;
  final String path;
  final String seperator;
  final TagKind kind;
  final String type;

  String toLine();
}

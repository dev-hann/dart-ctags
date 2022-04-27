import '../../tag.dart';

class PartOfTagItem extends TagItem {
  PartOfTagItem({
    required String name,
    required String filePath,
  }) : super(
    name: name,
    filePath: filePath,
    separator: '/^;"',
    kind: TagKind.partOf,
    type: "null",
  );

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), type];
}

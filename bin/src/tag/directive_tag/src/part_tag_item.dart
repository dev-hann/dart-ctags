import '../../tag.dart';

class PartTagItem extends TagItem {
  PartTagItem({
    required String name,
    required String filePath,
  }) : super(
          name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: TagKind.part,
          type: "null",
        );

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), type];
}

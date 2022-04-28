import '../../tag.dart';

class KlassTagItem extends TagItem {
  KlassTagItem({
    required String name,
    required String filePath,
    required String separator,
    required TagKind kind,
    required String type,
  }) : super(
          name: [name],
          filePath: filePath,
          separator: separator,
          kind: kind,
          type: type,
        );

  factory KlassTagItem.headLine({
    required String name,
    required String filePath,
  }) {
    return KlassTagItem(
      name: name,
      filePath: filePath,
      separator: '/class TestKlass {/;"',
      kind: TagKind.classes,
      type: "type:class",
    );
  }

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), type];
}

import '../../tag.dart';

class ImportTagItem extends TagItem {
  ImportTagItem({
    required String name,
    required String filePath,
    required TagKind kind,
  }) : super(
          name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: kind,
          type: "directive:import",
        );

  @override
  // TODO: implement componentList
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), type];
}

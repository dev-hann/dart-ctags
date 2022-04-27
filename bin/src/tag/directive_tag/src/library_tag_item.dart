import '../../tag.dart';

class LibraryTagItem extends TagItem {
  LibraryTagItem(
    String name,
    String filePath,
  ) : super(
          name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: TagKind.library,
          type: "null",
        );

  @override
  List<String> get componentList => [
        name,
        filePath,
        separator,
        kind.short(),
        type,
      ];
}

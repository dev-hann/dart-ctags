import '../../tag.dart';

class PartOfTagItem extends TagItem {
  PartOfTagItem({
    required List<String> name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: TagKind.partOf,
          type: "null",
          lineNumber: lineNumber,
        );

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), lineNumberText, type];
}

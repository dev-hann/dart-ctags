import '../../tag.dart';

class PartTagItem extends TagItem {
  PartTagItem({
    required List<String> name,
    required String filePath,
    required int?lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: TagKind.part,
          type: "null",
          lineNumber: lineNumber
        );

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), lineNumberText, type];
}

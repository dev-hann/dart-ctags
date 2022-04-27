import '../../tag.dart';

class ImportTagItem extends TagItem {
  ImportTagItem({
    required List<String> name,
    required String filePath,
    String? separator,
    String? type,
    int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          separator: separator ?? '/^;"',
          kind: _importTagKind(name),
          type: type ?? "directive:import",
          lineNumber: lineNumber,
        );

  factory ImportTagItem.haedLine({
    required String filePath,
  }) {
    return ImportTagItem(
      name: ["imports"],
      filePath: filePath,
      separator: '/import/;"',
      type: "type:directives",
    );
  }
  static TagKind _importTagKind(List<String> list) {
    if (list.length == 1 && list.first == "imports") return TagKind.imports;
    final _name = list[1];
    if (_name.contains("dart:")) return TagKind.dart;
    if (_name.contains("package:")) return TagKind.pub;
    return TagKind.local;
  }

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), lineNumberText, type];
}

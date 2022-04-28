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

  static TagKind _importTagKind(List<String> list) {
    final _name = list[1];
    if (_name.contains("dart:")) return TagKind.dart;
    if (_name.contains("package:")) return TagKind.pub;
    return TagKind.local;
  }

  @override
  List<String> get componentList =>
      [name, filePath, separator, kind.short(), lineNumberText, type];
}

import 'package:analyzer/dart/ast/ast.dart';

import '../../tag.dart';

class LibraryTagItem extends TagItem {
  LibraryTagItem(
    List<String> name,
    String filePath,
    int? lineNumber,
  ) : super(
        name: name,
          filePath: filePath,
          separator: '/^;"',
          kind: TagKind.library,
          type: "null",
          lineNumber: lineNumber,
        );

  @override
  List<String> get componentList => [
        name,
        filePath,
        separator,
        kind.short(),
        lineNumberText,
        type,
      ];

}

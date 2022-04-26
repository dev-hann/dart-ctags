library tag;

import 'package:analyzer/dart/ast/ast.dart';

part 'tag_kind.dart';

part 'import_tag.dart';
part 'library_tag.dart';

abstract class Tag {
  Tag({
    required this.nameEntity,
    required this.path,
    required this.kind,
    String? type,
  }) : type = type ?? "null";
  final List<String> nameEntity;
  String get filter;
  String get name {
    return nameEntity.where((e) {
      final str = e.toString();
      return str != filter && str != ";";
    }).join(" ");
  }

  final String path;
  final TagKind kind;
  final String type;
  final String sperator = '/^;"';

  String toLineTag() {
    return '$name\t$path\t$sperator\t${kind.short()}\t$type';
  }
}

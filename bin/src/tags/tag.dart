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
    final _res = nameEntity.where((e) {
      return e != filter && e != ";";
    }).join(" ");
    return _replaceAllQuotes(_res);
  }

  String _replaceAllQuotes(String traget) {
    return traget.replaceAll("'", "").replaceAll('"', "");
  }

  final String path;
  final TagKind kind;
  final String type;
  final String sperator = '/^;"';

  String toLineTag() {
    return '$name\t$path\t$sperator\t${kind.short()}\t$type';
  }

  factory Tag.fromUnit(Directive directive) {
    final entity = directive.childEntities.map((e) => e.toString()).toList();
    if (directive is LibraryDirective) {
      return LibraryTag(
        nameEntity: entity,
        path: '.',
      );
    } else if (directive is ImportDirective) {
      return ImportTag(
        nameEntity: entity,
        path: '.',
      );
    }
    throw Exception("No Type of Directive tag => $directive");
  }
}

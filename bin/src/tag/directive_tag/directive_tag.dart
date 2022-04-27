library directive_tag;

import 'package:analyzer/dart/ast/ast.dart';

import '../tag.dart';

part 'src/import_tag.dart';

part 'src/library_tag.dart';

part 'src/part_of_tag.dart';

part 'src/part_tag.dart';

abstract class DirectiveTag extends Tag {
  DirectiveTag({
    required TagKind kind,
  }) : super(kind: kind);

  factory DirectiveTag.fromDirective(Directive directive) {
    if (directive is LibraryDirective) {
      return LibraryTag();
    } else if (directive is ImportDirective) {
      return ImportTag();
    } else if (directive is PartDirective) {
      return PartTag();
    } else if (directive is PartOfDirective) {
      return PartOfTag();
    }
    throw Exception("No Type of Directive $directive");
  }
}

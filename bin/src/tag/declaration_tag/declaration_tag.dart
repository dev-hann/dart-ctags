library declaration_tag;

import '../tag.dart';

part 'src/klass_tag.dart';

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required TagKind kind,
    required String filePath,
  }) : super(
          kind: kind,
          filePath: filePath,
        );
}

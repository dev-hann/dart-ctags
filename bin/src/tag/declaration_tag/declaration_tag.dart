library declaration_tag;

import '../tag.dart';

part 'src/klass_tag.dart';

abstract class DeclarationTag extends Tag {
  DeclarationTag({
    required List<TagItem> itemList,
    required String filePath,
  }) : super(
          itemList: itemList,
          filePath: filePath,
        );


  // static List<DeclarationTag> fromDeclaration(Declaration declaration){

  // }
}

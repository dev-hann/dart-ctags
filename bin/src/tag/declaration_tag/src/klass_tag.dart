part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required List<TagItem> itemList,
    required String filePath,
  }) : super(
          itemList: itemList,
          filePath: filePath,
        );
}

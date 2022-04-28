part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required List<TagItem> itemList,
    required String filePath,
    required this.abstracts,
  }) : super(
          itemList: itemList,
          filePath: filePath,
        );

  final bool abstracts;

    
}

part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required TagKind kind,
    required String filePath,
  }) : super(
          kind: kind,
          filePath: filePath,
        );

  @override
  List<TagItem> loadTagItem() {
    // TODO: implement loadTagItem
    throw UnimplementedError();
  }
}

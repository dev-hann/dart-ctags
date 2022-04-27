part of directive_tag;

class PartOfTag extends DirectiveTag {
  PartOfTag({
    required List<PartOfTagItem> itemList,
    required String filePath,
  }) : super(
          filePath: filePath,
          itemList: itemList,
        );
}

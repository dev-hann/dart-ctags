part of directive_tag;

class PartTag extends DirectiveTag {
  PartTag({
    required List<PartTagItem> itemList,
    required String filePath,
  }) : super(
          filePath: filePath,
          itemList: itemList,
        );
}

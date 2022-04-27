part of directive_tag;

class ImportTag extends DirectiveTag {
  ImportTag({
    required List<ImportTagItem> itemList,
    required String filePath,
  }) : super(
          filePath: filePath,
          itemList: itemList,
        );
}

part of tag;

class ImportTagItem extends TagItem {
  ImportTagItem({
    required String name,
    required String path,
    required TagKind kind,
    required String type,
  }) : super(
          name: name,
          path: path,
          seperator: '/^;"',
          kind: kind,
          type: "directive:import",
        );

  @override
  String toLine() {
    return "";
  }
}

part of declaration_tag;

class FieldTag extends DeclarationTag {
  FieldTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? keyword,
    required String? type,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: TagKind.methods,
          isAbstract: false,
          typeList: [(keyword ?? "") + (type ?? "dynamic")],
        );
}

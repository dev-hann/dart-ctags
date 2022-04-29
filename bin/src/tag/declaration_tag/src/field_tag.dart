part of declaration_tag;

class FieldTag extends DeclarationTag {
  FieldTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? keyword,
    required String? type,
    required String? klass,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: TagKind.methods,
          isAbstract: false,
          type: (keyword ?? "") + (type ?? "dynamic"),
          // typeList: [(keyword ?? "") + (type ?? "dynamic")],
          klass: klass,
        );
}

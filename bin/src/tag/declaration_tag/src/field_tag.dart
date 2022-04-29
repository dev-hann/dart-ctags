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
          kind: TagKind.variables,
          isAbstract: false,
          type: Tag.join([keyword,(type ?? "dynamic")]),
          klass: klass,
        );
}

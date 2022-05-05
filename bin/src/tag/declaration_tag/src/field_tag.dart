part of declaration_tag;

class FieldTag extends KlassMemberTag {
  FieldTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? keyword,
    required String? type,
    required String klassName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: TagKind.fields,
          isAbstract: false,
          type: Tag.join([keyword, (type ?? "dynamic")]),
          klassName: klassName,
        );
}

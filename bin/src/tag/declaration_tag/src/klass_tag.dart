part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required String name,
    required String filePath,
    required bool isAbstract,
    required int? lineNumber,
    required String? extend,
    required String? implement,
    required String? withs,
    required String directive,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: TagKind.classes,
          isAbstract: isAbstract,
          directive: directive,
          typeList: ["class", (extend ?? ""), (implement ?? ""), (withs ?? "")],
        );
}

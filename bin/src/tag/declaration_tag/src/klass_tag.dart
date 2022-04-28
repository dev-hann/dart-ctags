part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required String name,
    required String filePath,
    required bool isAbstract,
    required int? lineNumber,
    required String extend,
    required String implement,
    required String withs,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: TagKind.classes,
          type: (isAbstract ? "Abstract class" : "class") +
              (extend ?? "") +
              (implement ?? "") +
              (withs ?? ""),
        );
}

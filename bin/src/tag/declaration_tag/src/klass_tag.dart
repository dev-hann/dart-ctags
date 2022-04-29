part of declaration_tag;

class KlassTag extends DeclarationTag {
  KlassTag({
    required String name,
    required String filePath,
    required bool isAbstract,
    required int? lineNumber,
    TagKind? kind,
    String? klass,
    String? type,
    bool? showAccess,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: kind ?? TagKind.classes,
          isAbstract: isAbstract,
          klass: klass,
          type: type ?? "class",
          showAccess: showAccess ?? true,
        );

  /// TODO: scope extends ,implement, with.
  factory KlassTag.extend({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String klass,
  }) {
    return KlassTag(
      name: name,
      filePath: filePath,
      isAbstract: false,
      lineNumber: lineNumber,
      kind: TagKind.extend,
      klass: klass,
      type: "",
      showAccess: false,
    );
  }

  factory KlassTag.implement({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String klass,
  }) {
    return KlassTag(
      name: name,
      filePath: filePath,
      isAbstract: false,
      lineNumber: lineNumber,
      kind: TagKind.implement,
      klass: klass,
      type: "",
      showAccess: false,
    );
  }

  factory KlassTag.withs({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String klass,
  }) {
    return KlassTag(
      name: name,
      filePath: filePath,
      isAbstract: false,
      lineNumber: lineNumber,
      kind: TagKind.withs,
      klass: klass,
      type: "",
      showAccess: false,
    );
  }
}

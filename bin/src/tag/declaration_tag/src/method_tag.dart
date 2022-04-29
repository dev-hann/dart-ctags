part of declaration_tag;

class MethodTag extends DeclarationTag {
  MethodTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String type,
    required bool isAbstract,
    required bool isGetter,
    required bool isSetter,
    required String parameters,
    required String? directives,
    TagKind? kind,
  })  : _signature = parameters,
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          isAbstract: isAbstract,
          kind: kind ?? TagKind.methods,
          directive: directives,
          typeList: [isGetter ? "get" : "", isSetter ? "set" : "", type],
        );
  final String _signature;

  String get signature => "signature:$_signature";
}

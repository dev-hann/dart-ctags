part of declaration_tag;

class FunctionsTag extends DeclarationTag {
  FunctionsTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String type,
    required String parameters,
  })  : _signature = parameters,
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          kind: TagKind.functions,
          type: type,
        );
  final String _signature;

  String get signature => "signature:$_signature";

  @override
  String get toLine {
    final _res = [
      name,
      filePath,
      address,
      kind.toValue(),
      access,
      lineNumberText,
      signature,
      type,
    ];
    return _res.join("\t");
  }
}

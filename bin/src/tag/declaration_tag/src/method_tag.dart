part of declaration_tag;

class MethodTag extends DeclarationTag {
  MethodTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? type,
    required bool isAbstract,
    required bool isGetter,
    required bool isSetter,
    required String? parameters,
    required String? klass,
    TagKind? kind,
  })  : _parameters = parameters,
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          isAbstract: isAbstract,
          kind: kind ?? TagKind.methods,
          klass: klass,
          type: Tag.join([
            (isGetter ? "get" : ""),
            (isSetter ? "set" : ""),
            (type ?? "void")
          ]),
        );
  final String? _parameters;

  String get parametersText => "signature:$_parameters";

  @override
  List<String> get tagComponent {
    final _res = super.tagComponent;
    if (_parameters != null) {
      _res.add(parametersText);
    }
    return _res;
  }
}

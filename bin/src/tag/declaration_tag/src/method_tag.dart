part of declaration_tag;

abstract class MethodTag extends DeclarationTag {
  MethodTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? type,
    required bool isAbstract,
    required bool isGetter,
    required bool isSetter,
    required String? parameters,
    TagKind? kind,
  })  : _parameters = parameters,
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          isAbstract: isAbstract,
          kind: kind ?? TagKind.methods,
          showAccess: true,
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

class KlassMethodTag extends MethodTag with MemberTagMixin {
  KlassMethodTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String? type,
    required bool isAbstract,
    required bool isGetter,
    required bool isSetter,
    required String? parameters,
    required this.klassName,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          isAbstract: isAbstract,
          isGetter: isGetter,
          isSetter: isSetter,
          parameters: parameters,
          type: type,
        );
  final String klassName;

  @override
  String get memberName => klassName;

  @override
  TagScopeKind get memberTag => TagScopeKind.klass;
}

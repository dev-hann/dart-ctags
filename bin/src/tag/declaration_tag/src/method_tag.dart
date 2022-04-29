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
    required String parameters,
    required String? klass,
    TagKind? kind,
  })  : _signature = parameters,
        super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          address: '/^;"',
          isAbstract: isAbstract,
          kind: kind ?? TagKind.methods,
          klass: klass,
          type: type??"void",
          // typeList: [
          //   isGetter ? "get" : "",
          //   isSetter ? "set" : "",
          //   type ?? "void"
          // ],
        );
  final String _signature;

  String get signature => "signature:$_signature";
}

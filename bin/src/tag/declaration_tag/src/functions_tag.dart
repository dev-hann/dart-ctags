part of declaration_tag;

class FunctionsTag extends MethodTag {
  FunctionsTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String type,
    required bool isGetter,
    required bool isSetter,
    required String parameters,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          type: type,
          isAbstract: false,
          isGetter: isGetter,
          isSetter: isSetter,
          parameters: parameters,
          kind: TagKind.functions,
        );
}

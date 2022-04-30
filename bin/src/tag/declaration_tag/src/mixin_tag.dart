part of declaration_tag;

/// TODO:make TagKind.on
class MixinTailTag extends TailTag {
  MixinTailTag({
    required String name,
    required String filePath,
    required int? lineNumber,
    required String mixinName,
    required TagKind kind,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: kind,
          memberName: mixinName,
          memberTag: TagScopeKind.mixin,
        );
}

class MxinTag extends HasTailTag {
  MxinTag({
    required String name,
    required String filePath,
    required int? lineNumber,
  }) : super(
          name: name,
          filePath: filePath,
          lineNumber: lineNumber,
          kind: TagKind.mixins,
          isAbstract: false,
          type: TagScopeKind.mixin.toValue(),
        );
}

part of tag;

enum TagScopeKind {
  klass,
  enums,
  mixin,
  directive,
}

const List<String> _scopeValue = [
  'class',
  'enum',
  'mixin',
  'directive',
];

extension TagScopeKindValue on TagScopeKind {
  String toValue() {
    return _scopeValue[index];
  }
}

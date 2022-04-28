part of tag;

enum TagKind {
  library,
  export,
  imports,
  dart,
  pub,
  local,
  part,
  partOf,
  consts,
  variables,
  functions,
  enums,
  constants,
  mixins,
  classes,
  extend,
  withs,
  implement,
  constructors,
  abstractFunction,
  fields,
  methods,
  staticMethods,
  getters,
  setters,
  operators,
}

const _value = <String>[
  'l',
  't',
  'i',
  'D',
  'U',
  'L',
  'P',
  'p',
  'C',
  'v',
  'F',
  'E',
  'e',
  'x',
  'c',
  'd',
  'w',
  'z',
  'r',
  'a',
  'f',
  'm',
  'M',
  'g',
  's',
  'o',
];

extension TagKindValue on TagKind {
  String toValue() {
    final index = TagKind.values.indexWhere((e) => e == this);
    if (index == -1) {
      throw Exception("None Value Kind $this");
    }
    return _value[index];
  }

  List<String> blackList() {
    switch (this) {
      case TagKind.library:
        return ['library'];
      case TagKind.export:
        // TODO: Handle this case.
        break;
      case TagKind.imports:
      case TagKind.dart:
      case TagKind.pub:
      case TagKind.local:
        return ['import'];
      case TagKind.part:
        return ['part'];
      case TagKind.partOf:
        return ['part', 'of'];
      case TagKind.consts:
        // TODO: Handle this case.
        break;
      case TagKind.variables:
        // TODO: Handle this case.
        break;
      case TagKind.functions:
        // TODO: Handle this case.
        break;
      case TagKind.enums:
        // TODO: Handle this case.
        break;
      case TagKind.constants:
        // TODO: Handle this case.
        break;
      case TagKind.mixins:
        // TODO: Handle this case.
        break;
      case TagKind.classes:
        // TODO: Handle this case.
        break;
      case TagKind.extend:
        // TODO: Handle this case.
        break;
      case TagKind.withs:
        // TODO: Handle this case.
        break;
      case TagKind.implement:
        // TODO: Handle this case.
        break;
      case TagKind.constructors:
        // TODO: Handle this case.
        break;
      case TagKind.abstractFunction:
        // TODO: Handle this case.
        break;
      case TagKind.fields:
        // TODO: Handle this case.
        break;
      case TagKind.methods:
        // TODO: Handle this case.
        break;
      case TagKind.staticMethods:
        // TODO: Handle this case.
        break;
      case TagKind.getters:
        // TODO: Handle this case.
        break;
      case TagKind.setters:
        // TODO: Handle this case.
        break;
      case TagKind.operators:
        // TODO: Handle this case.
        break;
    }
    return [];
  }
}

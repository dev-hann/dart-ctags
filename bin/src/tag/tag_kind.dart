part of tag;

enum TagKind {
  library,  // short 'l'
  export, // short 't'
  imports,  // short 'i'
  dart, // short 'D'
  pub,  // short 'U'
  local,  // short 'L'
  part, // short 'P'
  partOf, // short 'p'
  consts, // short 'C'
  variables,  // short 'v'
  functions,  // short 'F'
  enums,  // short 'E'
  constants,  // short 'e'
  mixins, // short 'x'
  classes,  // short 'c'
  extend, // short 'd'
  withs,  // short 'w'
  implement,  // short 'z'
  constructors, // short 'r'
  abstractFunction, // short 'a'
  fields, // short 'f'
  methods,  // short 'm'
  staticMethods,  // short 'M'
  getters,  // short 'g'
  setters,  // short 's'
  operators,  // short 'o'
}

const _value = <String>[
  'l', // long 'library'
  't', // long 'export'
  'i', // long 'imports'
  'D', // long 'dart'
  'U', // long 'pub'
  'L', // long 'local'
  'P', // long 'part'
  'p', // long 'partOf'
  'C', // long 'consts'
  'v', // long 'variables'
  'F', // long 'functions'
  'E', // long 'enums'
  'e', // long 'constants'
  'x', // long 'mixins'
  'c', // long 'classes'
  'd', // long 'extend'
  'w', // long 'withs'
  'z', // long 'implement'
  'r', // long 'constructors'
  'a', // long 'abstractFunction'
  'f', // long 'fields'
  'm', // long 'methods'
  'M', // long 'staticMethods'
  'g', // long 'getters'
  's', // long 'setters'
  'o', // long 'operators'
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

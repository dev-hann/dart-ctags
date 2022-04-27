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
  String short() {
    final index = TagKind.values.indexWhere((e) => e == this);
    if(index==-1){
      throw Exception("None Value Kind $this");
    }
    return _value[index];
  }
}

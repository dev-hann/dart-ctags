library dart_ctags;

import 'dart:io';

import 'package:args/args.dart';

part 'src/arguments.dart';

part 'src/enums.dart';

part 'src/tags.dart';

void main(List<String> arguments) {
  final Arguments _arg = Arguments();
  final _result = _arg.run(arguments);
  if (_result == null) return;
  final Tags _tags = Tags(
    optionList: _result.arguments,
    filePath: _result.rest,
  );
}

library dart_ctags;

import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:args/args.dart';

part 'src/arguments.dart';

part 'src/enums.dart';

part 'src/tags.dart';

part 'src/argument.dart';

void main(List<String> arguments) {
  final Arguments _arg = Arguments();
  final arg = _arg.run(arguments);
  if (arg == null) return;
  final Tags _tags = Tags(arg.filePath);
  final File _file = File(arg.output);
  final lines = _tags.generate();
  _file.writeAsStringSync(lines.join("\n"));
}

library dart_ctags;

import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

import 'src/tags/tag.dart';

part 'src/arguments.dart';

part 'src/enums.dart';

part 'src/tags.dart';

part 'src/options.dart';

void main(List<String> arguments) {
  final Arguments _arg = Arguments();
  final opts = _arg.run(arguments);
  if (opts == null) return;
  final Tags _tags = Tags(opts.filePath.first);
  final File _file = File(opts.output);
  final lines = _tags.generate();
  _file.writeAsStringSync(lines.join("\n"));
}

class Item {
  final String Hello = "";
}

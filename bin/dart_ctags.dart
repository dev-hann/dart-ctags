library dart_ctags;

import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

import 'src/tag/declaration_tag/declaration_tag.dart';
import 'src/tag/tag.dart';

part 'src/arguments.dart';

part 'src/enums.dart';

part 'src/tags.dart';

part 'src/options.dart';

void main(List<String> arguments) async {
  final Arguments _arg = Arguments();
  final opts = _arg.run(arguments);
  if (opts == null) return;
  
  final lines = <String>[...tagPrefix];
  for (final _path in opts.filePath) {
    final type = await FileSystemEntity.type(_path);
    if (type == FileSystemEntityType.directory) {
      final fileList = await Directory(_path)
          .list(recursive: true, followLinks: true)
          .toList();
      for (final file in fileList.toList()) {
        if (path.extension(file.path) == '.dart') {
          final Tags _tags = Tags(file.path,opts.lineNumber);
          lines.addAll(_tags.generate());
        }
      }
    } else if (type == FileSystemEntityType.file) {
      final Tags _tags = Tags(_path, opts.lineNumber);
      lines.addAll(_tags.generate());
    }
  }
  print(lines.join("\n"));
}

class TestKlass{

}

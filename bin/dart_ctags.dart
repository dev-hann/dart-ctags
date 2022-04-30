library dart_ctags;

import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

import 'src/tag/declaration_tag/declaration_tag.dart';
import 'src/tag/tag.dart';

part 'src/arguments.dart';

part 'src/tags.dart';

part 'src/options.dart';

void main(List<String> arguments) async {
  final Arguments _arg = Arguments();
  final opts = _arg.run(arguments);
  if (opts == null) return;

  final tagLineList = <String>[...tagPrefix];
  final _dartFileList = <String>[];

  for (final _path in opts.filePath) {
    final type = await FileSystemEntity.type(_path);
    if (type == FileSystemEntityType.directory) {
      final fileList = await Directory(_path)
          .list(recursive: true, followLinks: true)
          .toList();
      for (final file in fileList.toList()) {
        _dartFileList.add(file.path);
      }
    } else if (type == FileSystemEntityType.file) {
      _dartFileList.add(_path);
    }
  }

  for (final filePath in _dartFileList) {
    final Tags _tags = Tags(filePath, opts.lineNumber);
    tagLineList.addAll(_tags.toLineList());
  }

  final _res = tagLineList.join("\n");
  if (opts.output == null) {
    print(_res);
  } else {
    File(opts.output!).writeAsString(_res);
  }
}

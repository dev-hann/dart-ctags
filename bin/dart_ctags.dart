library dart_ctags;

import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
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
          final Tags _tags = Tags(file.path, opts.lineNumber);
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

String _main2(String aaa, dynamic xxx, {required String value}) {
  return "";
}

String _main3(String aaa, dynamic xxx, [String value = "xxx"]) {
  return "";
}

String get getttter => "Gettter";

class A {
  final String a = "";
  String b = "b";
  int aaaaa = 1;
  final lllll = "123123";
  void hello() {}
  String aa() {
    return "";
  }

  int bb() {
    return 1;
  }

  dynamic _cc() {
    return 0;
  }

  kk(String value) {}
}

abstract class D{}

class B {}

class C with A {}

// class AB implements A {}

class ABA extends A implements B {}

class ABC extends A implements B {}

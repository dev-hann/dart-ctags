part of dart_ctags;

class Tags {
  const Tags(this.filePath);

  final String filePath;

  List<String> generate() {
    final _res = <String>[
      '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;" to lines/',
      '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/'
    ];
    // print(filePath);
    final tmpRes = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
    final importList = _parseImport(tmpRes.unit);
    return _res;
  }

  List<String> _parseImport(CompilationUnit unit) {
    final _res = <String>[];
    if (unit.directives.any((d) => d is ImportDirective)) {
      final _list = [
        'import',
        path.relative(filePath, from: "'.'"),
        '/import/;"',
        'i',
        'line:${unit.lineInfo.getLocation(unit.directives[0].offset).lineNumber}',
        'type:directives',
      ];
      print(_list);
    }
    // final list = unit.directives.whereType<ImportDirective>();
    // final _path = path.relative(filePath, from: "'.'");
    // for (final import in list) {
    //   final tmpList = [
    //     'import',
    //     _path,
    //     '/import/;"',
    //     'i',
    //     'line:${unit.lineInfo.getLocation(unit.directives[0].offset).lineNumber}',
    //     'type:directives',
    //   ];
    //   _res.add(tmpList.join("\t"));
    // }

    return _res;
  }
}

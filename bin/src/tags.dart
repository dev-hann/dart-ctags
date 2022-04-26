part of dart_ctags;

class Tags {
  const Tags(this.filePath);

  final String filePath;
  final String output = '.';
  String get relativePath => path.relative(filePath, from: output);
  List<String> generate() {
    final _res = <String>[
      '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;" to lines/',
      '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/'
    ];
    // print(filePath);
    final tmpRes = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
    // final importList = _parseImport(tmpRes.unit);
    // importList.forEach(print);

    final libTag = _parseLibraryTag(tmpRes.unit);
    print(libTag!.toLineTag());

    return _res;
  }

  List<T> directiveList<T>(CompilationUnit unit) {
    return unit.directives.whereType<T>().toList();
  }

  String replaceAllQuotes(String traget) {
    return traget.replaceAll("'", "").replaceAll('"', "");
  }

  LibraryTag? _parseLibraryTag(CompilationUnit unit) {
    final _list = directiveList<LibraryDirective>(unit);
    if (_list.isEmpty) return null;

    return LibraryTag(
      nameEntity: _list.first.childEntities.map((e) => e.toString()).toList(),
      path: relativePath,
    );
  }

  List<String> _importHeader() {
    return [
      'import',
      path.relative(filePath, from: '.'),
      '/import/;"',
      'i',
      'type:directives',
    ];
  }

  List<List<String>> _parseImport(CompilationUnit unit) {
    final _res = <List<String>>[];
    final list = unit.directives.whereType<ImportDirective>().toList();
    if (list.isNotEmpty) {
      _res.add(_importHeader());
    }
    for (final d in list) {
      String tag = "L";
      final entity = d.childEntities
          .where((e) {
            final str = e.toString();
            return str != "import" && str != ";";
          })
          .join(" ")
          .replaceAll("'", "")
          .replaceAll('"', "");
      if (entity.contains("dart:")) {
        tag = "D";
      } else if (entity.contains("package:")) {
        tag = "U";
      }
      final _tmpLine = [
        entity,
        path.relative(filePath, from: '.'),
        '/^;"',
        tag,
        'directive:import',
      ];
      _res.add(_tmpLine);
    }
    return _res;
  }
}

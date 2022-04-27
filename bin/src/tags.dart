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
    final parseResult = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
    final unit = parseResult.unit;
    final List<Tag> tagList = <Tag>[];

    final _libTag = _parseLibraryTag(unit);
    if (_libTag != null) {
      tagList.add(_libTag);
    }
    
    final _importTags = _parseImport(unit);
    if(_importTags.isNotEmpty){
      tagList.addAll(_importTags);
    }
    
    tagList.forEach((e){
      print(e.toLineTag());
    });

    return _res;
  }

  List<T> directiveList<T>(CompilationUnit unit) {
    return unit.directives.whereType<T>().toList();
  }

  String replaceAllQuotes(String traget) {
    return traget.replaceAll("'", "").replaceAll('"', "");
  }

  bool checkContainType<T>(CompilationUnit unit) {
    final _list = directiveList<T>(unit);
    return _list.isNotEmpty;
  }

  LibraryTag? _parseLibraryTag(CompilationUnit unit) {
    final _list = directiveList<LibraryDirective>(unit);
    if (_list.isEmpty) return null;

    return LibraryTag(
      nameEntity: _list.first.childEntities.map((e) => e.toString()).toList(),
      path: relativePath,
    );
  }

  List<Tag> _parseImport(CompilationUnit unit) {
    final List<Tag> _res = <Tag>[];

    final _list = directiveList<ImportDirective>(unit);
    if (_list.isNotEmpty) {
      _res.add(ImportTag.headLine(unit));
      for (final d in _list) {
        final entity = d.childEntities.map((e) => e.toString()).toList();
        final tmpTag = ImportTag(
          nameEntity: entity,
          path: '.',
        );
        _res.add(tmpTag);
      }
    }

    return _res;
  }
}

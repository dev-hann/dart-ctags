part of dart_ctags;

const tagPrefix = <String>[
  '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;" to lines/',
  '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/',
  '!_TAG_PROGRAM_AUTHOR	{yoehwan}\t/{yoehwan@gmail.com}/',
  '!_TAG_PROGRAM_NAME {dart-ctags}',
  '!_TAG_PROGRAM_URL {https://github.com/yoehwan/dart-ctags}',
];

class Tags {
  const Tags(
    this.filePath,
    this.lineNumber,
  );

  final String filePath;
  final String root = '.';
  final bool lineNumber;


  List<String> toLineList() {
    if (path.extension(filePath) != ".dart") return [];
    final tagList = <Tag>[];
    final _result = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
    final unit = _result.unit;
    final _lineInfo = lineNumber ? unit.lineInfo : null;
    final _relativePath = path.relative(filePath, from: root);
    final directiveTagList = DirectiveTag.fromDirective(
      unit.directives,
      _relativePath,
      _lineInfo,
    );
    tagList.addAll(directiveTagList);

    final declarationTagList = DeclarationTag.fromDeclaration(
      unit.declarations,
      _relativePath,
      _lineInfo,
    );

    tagList.addAll(declarationTagList);

    return tagList.map((e) => e.toLine).toList();
  }
}

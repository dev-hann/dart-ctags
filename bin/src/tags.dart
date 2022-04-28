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
  final String output = '.';
  final bool lineNumber;
  String get relativePath => path.relative(filePath, from: output);

  List<String> generate() {
    final _res = <String>[];
    final parseResult = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
    final unit = parseResult.unit;
    final directiveTagList = DirectiveTag.fromDirective(
      unit.directives,
      relativePath,
      lineNumber ? unit.lineInfo : null,
    );

    for (final tag in directiveTagList) {
      _res.add(tag.toLines().join("\n"));
    }

    final declarationTagList = DeclarationTag.fromDeclaration(
      unit.declarations,
      relativePath,
      lineNumber ? unit.lineInfo : null,
    );
    for (final tag in declarationTagList) {
      _res.add(tag.toLines().join("\n"));
    }
    // return [];
    return _res;
  }
}

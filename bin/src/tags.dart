part of dart_ctags;

const _tagPreFix = <String>[
  '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;" to lines/',
  '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/',
  '!_TAG_PROGRAM_AUTHOR	{yoehwan}\t/{yoehwan@gmail.com}/',
  '!_TAG_PROGRAM_NAME {dart-ctags}',
  '!_TAG_PROGRAM_URL {https://github.com/yoehwan/dart-ctags}',
];

class Tags {
  const Tags(this.filePath);

  final String filePath;
  final String output = '.';

  String get relativePath => path.relative(filePath, from: output);

  List<String> generate() {
    final _res = [..._tagPreFix];
    final parseResult = parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());

    final unit = parseResult.unit;
    final directiveList = unit.directives;
    final list = DirectiveTag.fromDirective(directiveList, filePath);
    list.forEach((element) {
      print(element.toLines());
    });
    return _tagPreFix;
  }
}

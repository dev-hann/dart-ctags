part of dart_ctags;

class Tags {
  const Tags(this.filePath);

  final List<String> filePath;

  List<String> generate() {
    final _res = <String>[
      '!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;" to lines/',
      '!_TAG_FILE_SORTED\t1\t/0=unsorted, 1=sorted, 2=foldcase/'
    ];
    print(filePath);
    final tmpRes = parseFile(
        path: filePath.first, featureSet: FeatureSet.latestLanguageVersion());
    tmpRes.unit.directives.forEach((element) {
      print(element.toString());
    });
    return _res;
  }
}

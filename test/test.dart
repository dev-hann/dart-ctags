import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  final _current = path.join(path.current, "test");

  ParseStringResult _parse(String filePath) {
    return parseFile(
        path: filePath, featureSet: FeatureSet.latestLanguageVersion());
  }

  test("Test Klass", () {
    final _path = path.join(_current, "test_klass.dart");
    final _res = _parse("test_klass.dart");
  });
}

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

void main() {
  final _current = path.join(path.current, "test");
  print(_current);
  test("Directive", () {
    final _res = parseFile(
      path: path.join(_current,"test_directive.dart"),
      featureSet: FeatureSet.latestLanguageVersion(),
    );
    print(_res.unit);
  });
}

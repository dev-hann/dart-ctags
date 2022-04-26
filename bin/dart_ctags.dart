library dart_ctags;

import 'package:args/args.dart';

part 'src/arguments.dart';

part 'src/enums.dart';

void main(List<String> arguments) {
  final Arguments _arg = Arguments();
  _arg.run(arguments);
}

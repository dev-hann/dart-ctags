library dart_ctags;

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'src/enums.dart';

part 'src/argments.dart';
part 'src/consts.dart';

void main(List<String> arguments) {
  final Arguments _arg = Arguments();
  _arg.run(arguments);
}

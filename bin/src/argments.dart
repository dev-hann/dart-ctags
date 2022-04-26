part of dart_ctags;

typedef ArgumentCallback = Function(ArgumentsType type);

class Arguments {
  // final CommandRunner _runner = CommandRunner(appName, appDesc);
  final ArgParser _parser = ArgParser();
  void run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);

    final opts = _parser.parse(args);
    if (opts['help']) {
      print('\nUsage: \n\tdart_ctags [Options] [File(s)].\n');
      print('Available Options: \n');
      print(_parser.usage);
      return;
    }
  }
}

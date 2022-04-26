part of dart_ctags;

class Arguments {
  final ArgParser _parser = ArgParser();

  Argument? run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);
    _parser.addOption('output',
        abbr: 'o', help: 'Output file', valueHelp: 'File',defaultsTo: "./tags");
    try {
      final _result = _parser.parse(args);
      if (_result.arguments.isEmpty || _result['help']) {
        _help();
      }
      return Argument(
        filePath: _result.rest,
        output: _result['output'],
      );
    } catch (e) {
      if (e is FormatException) {
        print(e.message);
        _help();
      }
    }
    return null;
  }

  void _help() {
    print('\nUsage: \n\tdart_ctags [Options] [File(s)].\n');
    print('Available Options: \n');
    print(_parser.usage);
    exit(0);
  }
}

part of dart_ctags;

class Arguments {
  final ArgParser _parser = ArgParser();

  Options? run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);
    _parser.addOption('output',
        abbr: 'o', help: 'Output file', valueHelp: 'File', defaultsTo: "./tag");
    try {
      final _result = _parser.parse(args);
      if (_result['help']) {
        _help();
      }
      return Options(
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

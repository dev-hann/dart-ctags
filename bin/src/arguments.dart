part of dart_ctags;

class Arguments {
  final ArgParser _parser = ArgParser();

  Options? run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);
    _parser.addFlag('line-numbers',
        abbr: 'l', help: "Add Line Number", defaultsTo: true);
    _parser.addOption('output',
        abbr: 'o', help: 'Output file', valueHelp: 'File');
    try {
      final _result = _parser.parse(args);
      if (_result['help']) {
        _help();
      }
      List<String> _list = _result.rest;
      if (_list.isEmpty) {
        _list = ['.'];
      }
      return Options(
        filePath: _list,
        output: _result['output'],
        lineNumber: _result['line-numbers'] ?? true,
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

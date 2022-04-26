part of dart_ctags;

class Arguments {
  final ArgParser _parser = ArgParser();

  ArgResults? run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);
    try {
      final _result = _parser.parse(args);
      if (_result.arguments.isEmpty || _result['help']) {
        _help();
      }
      print(_result.arguments);
      return _result;
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

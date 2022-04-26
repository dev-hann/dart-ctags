part of dart_ctags;

typedef ArgumentCallback = Function(ArgumentsType type);

class Arguments {
  final ArgParser _parser = ArgParser();

  void run(List<String> args) {
    _parser.addFlag('help', abbr: 'h', help: 'Show help', negatable: false);

    final _result = _parser.parse(args);
    if (_result.arguments.isEmpty || _result['help']) {
      print('\nUsage: \n\tdart_ctags [Options] [File(s)].\n');
      print('Available Options: \n');
      print(_parser.usage);
      return;
    }
  }
}

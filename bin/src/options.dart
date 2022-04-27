part of dart_ctags;

class Options {
  const Options({
    required this.filePath,
    String? output,
  }) : output = output ?? "./tag";
  final String output;
  final List<String> filePath;

  Map<String, dynamic> toMap() {
    return {
      'output': output,
      'filePath': filePath,
    };
  }

  factory Options.fromMap(Map<String, dynamic> map) {
    return Options(
      output: map['output'] as String,
      filePath: map['filePath'] as List<String>,
    );
  }
}

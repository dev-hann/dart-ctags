part of dart_ctags;

class Argument {
  const Argument({
    required this.filePath,
    String? output,
  }) : output = output ?? "./tags";
  final String output;
  final List<String> filePath;

  Map<String, dynamic> toMap() {
    return {
      'output': output,
      'filePath': filePath,
    };
  }

  factory Argument.fromMap(Map<String, dynamic> map) {
    return Argument(
      output: map['output'] as String,
      filePath: map['filePath'] as List<String>,
    );
  }
}

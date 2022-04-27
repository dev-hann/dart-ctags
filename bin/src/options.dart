part of dart_ctags;


class Options {
  Options({
    required  this.filePath,
    required this.lineNumber,
    this.output,
  });
  final String? output;
  final List<String> filePath;
  final bool lineNumber;
  Map<String, dynamic> toMap() {
    return {
      'output': output,
      'filePath': filePath,
    };
  }
}

part of dart_ctags;

const _emptyPath = ['.'];

class Options {
  Options({
    required List<String> filePath,
    this.output,
  }) : filePath = filePath.isNotEmpty ? filePath : _emptyPath;
  final String? output;
  final List<String> filePath;

  Map<String, dynamic> toMap() {
    return {
      'output': output,
      'filePath': filePath,
    };
  }
}

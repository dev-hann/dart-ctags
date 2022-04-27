part of tag;

class LibraryTag extends Tag {
  LibraryTag({
    required this.name,
    required this.path,
  }) : super(null);
  final String name;
  final String path;

  @override
  String get headLine =>
      'import\t$name\t/import/;\t${TagKind.library.short()}\tnull';

  @override
  void init(CompilationUnit unit) {}
}

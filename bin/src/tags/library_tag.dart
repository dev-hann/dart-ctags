part of tag;

class LibraryTag extends Tag {
  LibraryTag({
    required List<String> nameEntity,
    required String path,
  }) : super(
          nameEntity: nameEntity,
          path: path,
          kind: TagKind.library,
        );

  @override
  String get filter => 'library';
}

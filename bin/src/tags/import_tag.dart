part of tag;

class ImportTage extends Tag {
  ImportTage({
    required List<String> nameEntity,
    required String path,
  }) : super(
          nameEntity: nameEntity,
          path: path,
          kind: TagKind.imports,
          type: "directive:import",
        );

  @override
  String get filter => 'import';
}

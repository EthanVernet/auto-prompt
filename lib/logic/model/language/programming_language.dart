/// Represents a programming language with its name and file extensions.
///
/// This class is used to model a programming language, including its name
/// and the extensions of files typically associated with it.
class ProgrammingLanguage {
  /// The name of the programming language.
  String name;

  /// A list of file extensions commonly used by this programming language.
  List<String> extensions;

  /// Constructs a [ProgrammingLanguage] with the given [name] and [extensions].
  ProgrammingLanguage(this.name, this.extensions);
}

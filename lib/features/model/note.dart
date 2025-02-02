class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
  });
  final int id;
  String title;
  String description;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}

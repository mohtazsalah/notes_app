class NoteModel{
  final int? id;
  final String? title;
  final String? subTitle;
  final String? date;

  NoteModel({
    this.id,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, subTitle: $subTitle, date: $date}';
  }
}
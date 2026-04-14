class TutorialData {
  final String id;
  final String title;
  final String content;

  TutorialData({
    required this.id,
    required this.title,
    required this.content,
  });

  factory TutorialData.fromMap(String id, Map<String, dynamic> data) {
    return TutorialData(
      id: id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
    );
  }
}
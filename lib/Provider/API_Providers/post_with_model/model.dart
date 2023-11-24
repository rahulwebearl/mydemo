class Posts {
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final int reactions;

  Posts({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      tags: List<String>.from(json['tags']),
      reactions: json['reactions'],
    );
  }
}

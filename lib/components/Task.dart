class Task {
  String id;
  final String title;
  final String notes;
  final String userEmail;
  final String userName;

  Task({
    this.id = '',
    required this.title,
    required this.notes,
    required this.userEmail,
    required this.userName,
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'title': title,
        'notes': notes,
        'userEmail': userEmail,
        'userName': userName,
      };

  static Task fromJSON(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        notes: json['notes'],
        userEmail: json['userEmail'],
        userName: json['userName'],
      );
}

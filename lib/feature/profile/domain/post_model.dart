import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  @override
  List<Object?> get props => [userId, id, title, body];

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
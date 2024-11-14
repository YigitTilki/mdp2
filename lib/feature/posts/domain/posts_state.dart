// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mdp2/feature/posts/domain/model/comment_model.dart';

class PostsState extends Equatable {
  const PostsState({this.comments});

  final AsyncValue<List<CommentModel>>? comments;

  @override
  List<Object?> get props => [comments];

  PostsState copyWith({
    AsyncValue<List<CommentModel>>? comments,
  }) {
    return PostsState(
      comments: comments ?? this.comments,
    );
  }
}

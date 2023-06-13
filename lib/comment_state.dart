import 'package:infinite_list/comment.dart';

class CommentState {
  CommentState(this.commentList);
  List<Comment> commentList = [];

  factory CommentState.intial() {
    return CommentState([]);
  }
  CommentState add(list) {
    commentList.addAll(list);
    return CommentState(commentList);
  }

  @override
  String toString() {
    return '$commentList';
  }
}

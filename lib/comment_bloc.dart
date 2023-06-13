// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/comment_event.dart';
import 'package:infinite_list/service.dart';
import 'package:infinite_list/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentState.intial()) {
    getCommentFromApi(0, 10).then((value) {
      emit(state.add(value));
    });
  }
  void handleActionBloc() async {
    final newLoad =
        await getCommentFromApi(state.commentList.length, 10).then((value) {
      return value;
    });

    emit(state.add(newLoad));

  }
}

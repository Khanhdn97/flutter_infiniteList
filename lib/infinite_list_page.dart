import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/comment_bloc.dart';
import 'package:infinite_list/comment.dart';
import 'package:infinite_list/comment_state.dart';

class InfiniteListPage extends StatefulWidget {
  const InfiniteListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InfiniteListPageState();
  }
}

class _InfiniteListPageState extends State<InfiniteListPage> {
  List<Comment> infList = List.empty();

  @override
  Widget build(BuildContext context) {
    final commentBloc = BlocProvider.of<CommentBloc>(context); //CommentBloc();
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        commentBloc.handleActionBloc();
      }
    });
    return Scaffold(
        body: SafeArea(child: BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        infList = state.commentList;
        return ListView.builder(
          controller: scrollController,
          itemCount: infList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                '${infList[index].id}',
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                infList[index].name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(infList[index].body,
                  style: const TextStyle(fontSize: 20)),
            );
          },
        );
      },
    )));
  }
}

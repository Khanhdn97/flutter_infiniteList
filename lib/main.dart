import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/comment_bloc.dart';
import 'package:infinite_list/infinite_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinity List',
      home: BlocProvider(
          create: (context) => CommentBloc(), child: const InfiniteListPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

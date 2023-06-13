import 'dart:convert';
import 'package:infinite_list/comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> getCommentFromApi(int start, int limit) async {
  final client = http.Client();
  final url =
      "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  try {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final comments = data.map((e) {
        return Comment(
            name: e['name'], email: e['email'], body: e['body'], id: e['id']);
      });
      return comments.toList();
    } else {
      return List<Comment>.empty();
    }
  } catch (error) {
    print('error');
    return List<Comment>.empty();
  }
}

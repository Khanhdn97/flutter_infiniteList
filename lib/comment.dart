class Comment {
  final int id;
  final String name;
  final String email;
  final String body;
  Comment({required this.name, required this.email, required this.body,required this.id});
  @override
  String toString() {
    return 'id : $id , name: $name';
  }
}
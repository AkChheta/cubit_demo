import 'dart:convert';

import 'package:blocdemo/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<Todo>> getAll() async {
    const url =
        "https://api.github.com/users/JakeWharton/repos?page=1&per_page=15";
    final uri = Uri.parse(url);
    final respose = await http.get(uri);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body) as List;
      final result = json.map((e) {
        return Todo(
          name: e['name'],
          description: e['description'],
        );
      }).toList();
      return result;
    } else {
      throw 'Something went wrongcode${respose.statusCode}';
    }
  }
}

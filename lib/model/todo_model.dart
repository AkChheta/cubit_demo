class Todo {
  var id;
  String? name;
  String? description;

  Todo({
    this.id,
    this.name,
    this.description,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;

    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'employeeName': name,
      'description': description,
    };
  }
}

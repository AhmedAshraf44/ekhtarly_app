class ProgramModel {
  String? name;
  String? id;

  ProgramModel({required this.name, required this.id});

  factory ProgramModel.fromjson(Map<String, dynamic> json) {
    return ProgramModel(name: json['name'], id: json['id']);
  }
}

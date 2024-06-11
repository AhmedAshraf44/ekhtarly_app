class Profile {
  String? name;
  String? email;

  Profile({this.name, this.email});

  factory Profile.fromjson(Map<String,dynamic> json) {
    return Profile(name: json['user']['name'], email: json['user']['email']);
  }
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
	final String? name;
	final String? email;
	final String? password;
	final String? rule;
	final String? id;
	final int? v;

	const User({
		this.name, 
		this.email, 
		this.password, 
		this.rule, 
		this.id, 
		this.v, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				name: json['name'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				rule: json['rule'] as String?,
				id: json['_id'] as String?,
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'email': email,
				'password': password,
				'rule': rule,
				'_id': id,
				'__v': v,
			};

	@override
	List<Object?> get props => [name, email, password, rule, id, v];
}

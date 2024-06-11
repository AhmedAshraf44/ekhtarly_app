import 'package:equatable/equatable.dart';

class DeleteFavoriteModel extends Equatable {
	final String? message;
	final List<String>? user;

	const DeleteFavoriteModel({this.message, this.user});

	factory DeleteFavoriteModel.fromJson(Map<String, dynamic> json) {
		return DeleteFavoriteModel(
			message: json['message'] as String?,
			user: json['user'] as List<String>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'user': user,
			};

	@override
	List<Object?> get props => [message, user];
}

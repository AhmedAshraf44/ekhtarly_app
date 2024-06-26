import 'package:equatable/equatable.dart';

class AddFavotiteModel extends Equatable {
	final String? state;
	final List<dynamic>? favoriteList;

	const AddFavotiteModel({this.state, this.favoriteList});

	factory AddFavotiteModel.fromJson(Map<String, dynamic> json) {
		return AddFavotiteModel(
			state: json['state'] as String?,
			favoriteList: json['favoriteList'] as List<dynamic>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'state': state,
				'favoriteList': favoriteList,
			};

	@override
	List<Object?> get props => [state, favoriteList];
}

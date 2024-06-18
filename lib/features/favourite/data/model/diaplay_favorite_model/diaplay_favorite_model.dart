import 'package:equatable/equatable.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';
// 2
class DisplayFavoriteModel extends Equatable {
	final String? state;
	final List<Laptops> laptops;

	const DisplayFavoriteModel({this.state,required this.laptops});

	factory DisplayFavoriteModel.fromJson(Map<String, dynamic> json) {
		return DisplayFavoriteModel(
			state: json['state'] as String?,
			laptops: (json['Laptops'] as List<dynamic>)
						.map((e) => Laptops.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'state': state,
				'Laptops': laptops.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [state, laptops];
}

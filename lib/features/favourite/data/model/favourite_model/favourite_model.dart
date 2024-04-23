import 'package:equatable/equatable.dart';

import '../../../../../core/models/newest_laptops_details_model/laptops.dart';

class FavouriteModel extends Equatable {
  final String? state;
  final List<Laptops>? favoriteList;

  const FavouriteModel({this.state, this.favoriteList});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      state: json['state'] as String?,
      favoriteList: (json['favoriteList'] as List<dynamic>?)
          ?.map((e) => Laptops.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'state': state,
        'favoriteList': favoriteList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [state, favoriteList];
}

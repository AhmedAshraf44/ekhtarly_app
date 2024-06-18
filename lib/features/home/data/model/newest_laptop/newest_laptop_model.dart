import 'package:equatable/equatable.dart';
import '../../../../../core/models/newest_laptops_details_model/laptops.dart';

class NewestLaptopModel extends Equatable {
  final String? state;
  final int? length;
  final List<Laptops>? laptops;

  const NewestLaptopModel({this.state, this.length, this.laptops});

  factory NewestLaptopModel.fromJson(Map<String, dynamic> json) =>
      NewestLaptopModel(
        state: json['state'] as String?,
        length: json['length'] as int?,
        laptops: (json['Laptops'] as List<dynamic>?)
            ?.map((e) => Laptops.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'length': length,
        'Laptops': laptops?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [state, length, laptops];
}

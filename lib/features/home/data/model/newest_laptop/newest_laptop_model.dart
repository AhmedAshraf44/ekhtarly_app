import 'package:equatable/equatable.dart';

import 'result.dart';

class NewestLaptopModel extends Equatable {
  final String? state;
  final int? length;
  final List<Result>? result;

  const NewestLaptopModel({this.state, this.length, this.result});

  factory NewestLaptopModel.fromJson(Map<String, dynamic> json) => NewestLaptopModel(
        state: json['state'] as String?,
        length: json['length'] as int?,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'length': length,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [state, length, result];
}

import 'package:equatable/equatable.dart';

class FavoriteList extends Equatable {
	final String? brand;
	final String? name;
	final int? price;
	final double? specRating;
	final String? processor;
	final String? cpu;
	final String? ram;
	final String? ramType;
	final String? rom;
	final String? romType;
	final String? gpu;
	final double? displaySize;
	final int? resolutionWidth;
	final int? resolutionHeight;
	final String? os;
	final int? warranty;
	final int? cpuMark;
	final int? gpuMark;
	final String? id;

	const FavoriteList({
		this.brand, 
		this.name, 
		this.price, 
		this.specRating, 
		this.processor, 
		this.cpu, 
		this.ram, 
		this.ramType, 
		this.rom, 
		this.romType, 
		this.gpu, 
		this.displaySize, 
		this.resolutionWidth, 
		this.resolutionHeight, 
		this.os, 
		this.warranty, 
		this.cpuMark, 
		this.gpuMark, 
		this.id, 
	});

	factory FavoriteList.fromJson(Map<String, dynamic> json) => FavoriteList(
				brand: json['brand'] as String?,
				name: json['name'] as String?,
				price: json['price'] as int?,
				specRating: (json['spec_rating'] as num?)?.toDouble(),
				processor: json['processor'] as String?,
				cpu: json['CPU'] as String?,
				ram: json['Ram'] as String?,
				ramType: json['Ram_type'] as String?,
				rom: json['ROM'] as String?,
				romType: json['ROM_type'] as String?,
				gpu: json['GPU'] as String?,
				displaySize: (json['display_size'] as num?)?.toDouble(),
				resolutionWidth: json['resolution_width'] as int?,
				resolutionHeight: json['resolution_height'] as int?,
				os: json['OS'] as String?,
				warranty: json['warranty'] as int?,
				cpuMark: json['CPU_Mark'] as int?,
				gpuMark: json['GPU_Mark'] as int?,
				id: json['id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'brand': brand,
				'name': name,
				'price': price,
				'spec_rating': specRating,
				'processor': processor,
				'CPU': cpu,
				'Ram': ram,
				'Ram_type': ramType,
				'ROM': rom,
				'ROM_type': romType,
				'GPU': gpu,
				'display_size': displaySize,
				'resolution_width': resolutionWidth,
				'resolution_height': resolutionHeight,
				'OS': os,
				'warranty': warranty,
				'CPU_Mark': cpuMark,
				'GPU_Mark': gpuMark,
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				brand,
				name,
				price,
				specRating,
				processor,
				cpu,
				ram,
				ramType,
				rom,
				romType,
				gpu,
				displaySize,
				resolutionWidth,
				resolutionHeight,
				os,
				warranty,
				cpuMark,
				gpuMark,
				id,
		];
	}
}

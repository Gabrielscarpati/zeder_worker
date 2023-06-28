import '../../core/core.dart';


class CityEntity extends Entity {
  final String country;
  final String name;
  final String uf;

  CityEntity({
    required super.id,
    required this.country,
    required this.name,
    required this.uf,
  });

  factory CityEntity.fromJson(Map<String, dynamic> json) {
    return CityEntity(
      id: json['id'] ?? '',
      country: json['country'] ?? '',
      name: json['name'] ?? '',
      uf: json['uf'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'name': name,
      'uf': uf,
    };
  }

  CityEntity copyWith({
    String? id,
    String? country,
    String? name,
    String? uf,

  }) {
    return CityEntity(
      id: id ?? this.id,
      country: country ?? this.country,
      name: name ?? this.name,
      uf: uf ?? this.uf,
    );
  }
}

abstract class CidadeRepository extends Repository<CityEntity> {}

class CidadeAdapter extends Adapter<CityEntity> {
  @override
  CityEntity fromJson(Map<String, dynamic> json) {
    return CityEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CityEntity entity) {
    return entity.toJson();
  }
}

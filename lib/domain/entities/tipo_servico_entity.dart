import '../../core/core.dart';

class TipoServicoEntity extends Entity {
  final String name;
  final String icon;
  final String numero_de_servicos;
  final List basicFlow;
  final double initialPrice;
  final String country;

  TipoServicoEntity({
    required this.numero_de_servicos,
    required super.id,
    required this.name,
    required this.icon,
    required this.basicFlow,
    required this.initialPrice,
    required this.country,
  });

  factory TipoServicoEntity.fromJson(Map<String, dynamic> json) {
    return TipoServicoEntity(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      numero_de_servicos: json['numero_de_servicos'] ?? '',
      basicFlow: json['basic_flow'] ?? [],
      initialPrice: double.parse(json['initial_price']) ?? 0,
      country: json['country'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'numero_de_servicos': numero_de_servicos,
      'basic_flow': basicFlow,
      'initial_price': initialPrice,
      'country': country,
    };
  }

  TipoServicoEntity copyWith({
    String? id,
    String? name,
    String? icon,
    String? numero_de_servicos,
    List? basicFlow,
    double? initialPrice,
    String? country,
  }) {
    return TipoServicoEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      numero_de_servicos: numero_de_servicos ?? this.numero_de_servicos,
      basicFlow: basicFlow ?? this.basicFlow,
      initialPrice: initialPrice ?? this.initialPrice,
      country: country ?? this.country,
    );
  }
}

abstract class TipoServicoRepository extends Repository<TipoServicoEntity> {}

class TipoServicoAdapter extends Adapter<TipoServicoEntity> {
  @override
  TipoServicoEntity fromJson(Map<String, dynamic> json) {
    return TipoServicoEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TipoServicoEntity entity) {
    return entity.toJson();
  }
}

import '../../core/core.dart';

class TipoServicoEntity extends Entity {
  final String nome;
  final String icone;
  final String numero_de_servicos;

  TipoServicoEntity({
    required this.numero_de_servicos,
    required super.id,
    required this.nome,
    required this.icone,
  });

  factory TipoServicoEntity.fromJson(Map<String, dynamic> json) {
    return TipoServicoEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      icone: json['icone'] ?? '',
      numero_de_servicos: json['numero_de_servicos'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'icone': icone,
      'numero_de_servicos': numero_de_servicos,
    };
  }

  TipoServicoEntity copyWith({
    String? id,
    String? nome,
    String? icone,
    String? numero_de_servicos,
  }) {
    return TipoServicoEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
      numero_de_servicos: numero_de_servicos ?? this.numero_de_servicos,
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

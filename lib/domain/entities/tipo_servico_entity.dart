import '../../core/core.dart';

class TipoServicoEntity extends Entity {
  final String nome;
  final String icone;

  TipoServicoEntity({
    required super.id,
    required this.nome,
    required this.icone,
  });

  factory TipoServicoEntity.fromJson(Map<String, dynamic> json) {
    return TipoServicoEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      icone: json['icone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'icone': icone,
    };
  }

  TipoServicoEntity copyWith({
    String? id,
    String? nome,
    String? icone,
  }) {
    return TipoServicoEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
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

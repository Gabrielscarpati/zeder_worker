class TipoServicoEntity {
  final String id;
  final String nome;
  final String icone;

  TipoServicoEntity({
    required this.id,
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

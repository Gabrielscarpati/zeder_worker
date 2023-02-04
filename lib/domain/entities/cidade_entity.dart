class CidadeEntity {
  final String id;
  final String nome;
  final String uf;

  CidadeEntity({
    required this.id,
    required this.nome,
    required this.uf,
  });

  factory CidadeEntity.fromJson(Map<String, dynamic> json) {
    return CidadeEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      uf: json['uf'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'uf': uf,
    };
  }

  CidadeEntity copyWith({
    String? id,
    String? nome,
    String? uf,
  }) {
    return CidadeEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      uf: uf ?? this.uf,
    );
  }
}

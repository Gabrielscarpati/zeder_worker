import '../../core/core.dart';

class ClienteEntity extends Entity {
  final String nome;
  final String email;
  final String cpfCnpj;
  final String tipoPessoa;

  ClienteEntity({
    required super.id,
    required this.nome,
    required this.email,
    required this.cpfCnpj,
    required this.tipoPessoa,
  });

  factory ClienteEntity.fromJson(Map<String, dynamic> json) {
    return ClienteEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      cpfCnpj: json['cpfCnpj'] ?? '',
      tipoPessoa: json['tipoPessoa'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cpfCnpj': cpfCnpj,
      'tipoPessoa': tipoPessoa,
    };
  }

  ClienteEntity copyWith({
    String? id,
    String? nome,
    String? email,
    String? cpfCnpj,
    String? tipoPessoa,
  }) {
    return ClienteEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      tipoPessoa: tipoPessoa ?? this.tipoPessoa,
    );
  }
}

abstract class ClienteRepository extends Repository<ClienteEntity> {}

class ClienteAdapter extends Adapter<ClienteEntity> {
  @override
  ClienteEntity fromJson(Map<String, dynamic> json) {
    return ClienteEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ClienteEntity entity) {
    return entity.toJson();
  }
}

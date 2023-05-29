import '../../core/core.dart';

class ClienteEntity extends Entity {
  final String nome;
  final String email;
  final String cpfCnpj;
  final String tipoPessoa;
  final String profile_picture;
  final String phone;


  ClienteEntity( {
    required super.id,
    required this.nome,
    required this.email,
    required this.cpfCnpj,
    required this.tipoPessoa,
    required this.profile_picture,
    required this.phone,
  });

  factory ClienteEntity.fromJson(Map<String, dynamic> json) {
    return ClienteEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      cpfCnpj: json['cpfCnpj'] ?? '',
      tipoPessoa: json['tipoPessoa'] ?? '',
      profile_picture: json['profile_picture'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cpfCnpj': cpfCnpj,
      'tipoPessoa': tipoPessoa,
      'profile_picture': profile_picture,
      'phone': phone,
    };
  }

  ClienteEntity copyWith({
    String? id,
    String? nome,
    String? email,
    String? cpfCnpj,
    String? tipoPessoa,
    String? profile_picture,
    String? phone,
  }) {
    return ClienteEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      tipoPessoa: tipoPessoa ?? this.tipoPessoa,
      profile_picture: profile_picture ?? this.profile_picture,
      phone: phone ?? this.phone,
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

import '../../core/core.dart';

class UserEntity extends Entity {
  final String nome;
  final String email;
  final String cpfCnpj;
  final String tipoPessoa;
  final String profile_picture;
  final String phone;
  final List servicos;


  UserEntity({
    required super.id,
    required this.nome,
    required this.email,
    required this.cpfCnpj,
    required this.tipoPessoa,
    required this.profile_picture,
    required this.phone,
    required this.servicos,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      cpfCnpj: json['cpfCnpj'] ?? '',
      tipoPessoa: json['tipoPessoa'] ?? '',
      profile_picture: json['profile_picture'] ?? '',
      phone: json['phone'] ?? '',
      servicos: json['servicos'] ?? [],
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
      'servicos': servicos,
    };
  }

  UserEntity copyWith({
    String? id,
    String? nome,
    String? email,
    String? cpfCnpj,
    String? tipoPessoa,
    String? profile_picture,
    String? phone,
    List<String>? servicos,


  }) {
    return UserEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      tipoPessoa: tipoPessoa ?? this.tipoPessoa,
      profile_picture: profile_picture ?? this.profile_picture,
      phone: phone ?? this.phone,
      servicos: servicos ?? this.servicos,
    );
  }
}

abstract class ClienteRepository extends Repository<UserEntity> {}

class ClienteAdapter extends Adapter<UserEntity> {
  @override
  UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserEntity entity) {
    return entity.toJson();
  }
}

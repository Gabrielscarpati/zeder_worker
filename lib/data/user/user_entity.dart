import '../../core/core.dart';

class WorkerEntity extends Entity {
  final String nome;
  final String email;
  final String cpfCnpj;
  final String tipoPessoa;
  final String profile_picture;
  final String phone;
  final List servicos;
  final List my_cities;

  WorkerEntity({
    required super.id,
    required this.nome,
    required this.email,
    required this.cpfCnpj,
    required this.tipoPessoa,
    required this.profile_picture,
    required this.phone,
    required this.servicos,
    required this.my_cities,
  });

  factory WorkerEntity.fromJson(Map<String, dynamic> json) {
    return WorkerEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      cpfCnpj: json['cpfCnpj'] ?? '',
      tipoPessoa: json['tipoPessoa'] ?? '',
      profile_picture: json['profile_picture'] ?? '',
      phone: json['phone'] ?? '',
      servicos: json['servicos'] ?? [],
      my_cities: json['my_cities'] ?? [],
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
      'my_cities': my_cities,
    };
  }

  WorkerEntity copyWith({
    String? id,
    String? nome,
    String? email,
    String? cpfCnpj,
    String? tipoPessoa,
    String? profile_picture,
    String? phone,
    List<String>? servicos,
    List<String>? my_cities,

  }) {
    return WorkerEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      tipoPessoa: tipoPessoa ?? this.tipoPessoa,
      profile_picture: profile_picture ?? this.profile_picture,
      phone: phone ?? this.phone,
      servicos: servicos ?? this.servicos,
      my_cities: my_cities ?? this.my_cities,
    );
  }
}

abstract class ClienteRepository extends Repository<WorkerEntity> {}

class ClienteAdapter extends Adapter<WorkerEntity> {
  @override
  WorkerEntity fromJson(Map<String, dynamic> json) {
    return WorkerEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(WorkerEntity entity) {
    return entity.toJson();
  }
}

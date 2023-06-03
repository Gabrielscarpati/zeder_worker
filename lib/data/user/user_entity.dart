import '../../core/core.dart';

class WorkerEntity extends Entity<WorkerEntity> {
  final String nome;
  final String email;
  final String cpfCnpj;
  final String tipoPessoa;
  final String profile_picture;
  final String phone;
  final List servicos;
  final List my_cities;
  final int numberRating1;
  final int numberRating2;
  final int numberRating3;
  final int numberRating4;
  final int numberRating5;

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
    required this.numberRating1,
    required this.numberRating2,
    required this.numberRating3,
    required this.numberRating4,
    required this.numberRating5,
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
      numberRating1: json['numberRating1'] ?? 0,
      numberRating2: json['numberRating2'] ?? 0,
      numberRating3: json['numberRating3'] ?? 0,
      numberRating4: json['numberRating4'] ?? 0,
      numberRating5: json['numberRating5'] ?? 0,
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
      'numberRating1': numberRating1,
      'numberRating2': numberRating2,
      'numberRating3': numberRating3,
      'numberRating4': numberRating4,
      'numberRating5': numberRating5,
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
    int? numberRating1,
    int? numberRating2,
    int? numberRating3,
    int? numberRating4,
    int? numberRating5,

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
      numberRating1: numberRating1 ?? this.numberRating1,
      numberRating2: numberRating2 ?? this.numberRating2,
      numberRating3: numberRating3 ?? this.numberRating3,
      numberRating4: numberRating4 ?? this.numberRating4,
      numberRating5: numberRating5 ?? this.numberRating5,
    );
  }

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
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

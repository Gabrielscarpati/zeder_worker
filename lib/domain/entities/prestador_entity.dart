import '../../core/core.dart';

class PrestadorEntity {
  final String id;
  final String nome;
  final String email;
  final int qtdeNotas1;
  final int qtdeNotas2;
  final int qtdeNotas3;
  final int qtdeNotas4;
  final int qtdeNotas5;

  int get qtdeNotas => (qtdeNotas1 + qtdeNotas2 + qtdeNotas3 + qtdeNotas4 + qtdeNotas5);

  /// https://calculator.academy/average-rating-calculator-star-rating/#f1p1|f2p0
  /// AR = 1*a+2*b+3*c+4*d+5*e/(R)
  double get nota => qtdeNotas == 0 ? 0 : ((qtdeNotas1 * 1) + (qtdeNotas2 * 2) + (qtdeNotas3 * 3) + (qtdeNotas4 * 4) + (qtdeNotas5 * 5)) / qtdeNotas;

  PrestadorEntity({
    required this.id,
    required this.nome,
    required this.email,
    required this.qtdeNotas1,
    required this.qtdeNotas2,
    required this.qtdeNotas3,
    required this.qtdeNotas4,
    required this.qtdeNotas5,
  });

  factory PrestadorEntity.fromJson(Map<String, dynamic> json) {
    return PrestadorEntity(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      qtdeNotas1: IntUtil.toIntDefaultZero(json['qtdeNotas1']),
      qtdeNotas2: IntUtil.toIntDefaultZero(json['qtdeNotas2']),
      qtdeNotas3: IntUtil.toIntDefaultZero(json['qtdeNotas3']),
      qtdeNotas4: IntUtil.toIntDefaultZero(json['qtdeNotas4']),
      qtdeNotas5: IntUtil.toIntDefaultZero(json['qtdeNotas5']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'qtdeNotas1': qtdeNotas1,
      'qtdeNotas2': qtdeNotas2,
      'qtdeNotas3': qtdeNotas3,
      'qtdeNotas4': qtdeNotas4,
      'qtdeNotas5': qtdeNotas5,
    };
  }

  PrestadorEntity copyWith({
    String? id,
    String? nome,
    String? email,
    int? qtdeNotas1,
    int? qtdeNotas2,
    int? qtdeNotas3,
    int? qtdeNotas4,
    int? qtdeNotas5,
  }) {
    return PrestadorEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      qtdeNotas1: qtdeNotas1 ?? this.qtdeNotas1,
      qtdeNotas2: qtdeNotas2 ?? this.qtdeNotas2,
      qtdeNotas3: qtdeNotas3 ?? this.qtdeNotas3,
      qtdeNotas4: qtdeNotas4 ?? this.qtdeNotas4,
      qtdeNotas5: qtdeNotas5 ?? this.qtdeNotas5,
    );
  }
}

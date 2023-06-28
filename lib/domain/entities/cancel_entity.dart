import '../../core/core.dart';

class CancelEntity extends Entity<CancelEntity> {
  final String idServico;
  final String idClient;
  final String idWorker;
  final String message;
  final bool needsAction;
  final DateTime dataCreated;

  CancelEntity({
    required super.id,
    required this.idWorker,
    required this.idServico,
    required this.dataCreated,
    required this.message,
    required this.needsAction,
    required this.idClient,
  });

  factory CancelEntity.fromJson(Map<String, dynamic> json) {
    return CancelEntity(
      id: json['id'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idServico: json['idServico'] ?? '',
      dataCreated: DateUtil.toDateTimeDefaultDateZero(json['dataCreated']),
      message: json['message'] ?? '',
      needsAction: json['needsAction'] ?? false,
      idClient: json['idClient'],
    );
  }

  CancelEntity fromJson(Map<String, dynamic> json) {
    return CancelEntity(
      id: json['id'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idServico: json['idServico'] ?? '',
      dataCreated: DateUtil.toDateTimeDefaultDateZero(json['dataCreated']),
      message: json['message'] ?? '',
      needsAction: json['needsAction'] ?? false,
      idClient: json['idClient'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idWorker': idWorker,
      'idServico': idServico,
      'dataCreated': dataCreated,
      'message': message,
      'needsAction': needsAction,
      'idClient': idClient,
    };
  }

  CancelEntity copyWith({
    String? id,
    String? idServico,
    String? idCity,
    String? idClient,
    String? idWorker,
    String? message,
    bool? needsAction,
    String? value,
    Map? aditionalData,
    DateTime? dataCreated,
  }) {
    return CancelEntity(
      idServico: idServico ?? this.idServico,
      idClient: idClient ?? this.idClient,
      idWorker: idWorker ?? this.idWorker,
      message: message ?? this.message,
      needsAction: needsAction ?? this.needsAction,
      dataCreated: dataCreated ?? this.dataCreated,
      id: id ?? this.id,
    );
  }
}
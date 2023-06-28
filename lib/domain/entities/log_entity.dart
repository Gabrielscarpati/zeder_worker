import '../../core/core.dart';

class LogEntity extends Entity<LogEntity> {
  final String idServico;
  final String idCity;
  final String idClient;
  final String idWorker;
  final String message;
  final bool needsAction;
  final String value;
  final Map aditionalData;
  final DateTime dataCreated;

  LogEntity({
    required super.id,
    required this.idWorker,
    required this.idServico,
    required this.dataCreated,
    required this.message,
    required this.needsAction,
    required this.value,
    required this.idCity,
    required this.aditionalData,
    required this.idClient,
  });

  factory LogEntity.fromJson(Map<String, dynamic> json) {
    return LogEntity(
      id: json['id'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idServico: json['idServico'] ?? '',
      dataCreated: DateUtil.toDateTimeDefaultDateZero(json['dataCreated']),
      message: json['message'] ?? '',
      needsAction: json['needsAction'] ?? false,
      value: json['value'] ?? '',
      aditionalData: json['aditionalData'] ?? {},
      idCity: json['idCity'],
      idClient: json['idClient'],
    );
  }

  LogEntity fromJson(Map<String, dynamic> json) {
    return LogEntity(
      id: json['id'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idServico: json['idServico'] ?? '',
      dataCreated: DateUtil.toDateTimeDefaultDateZero(json['dataCreated']),
      message: json['message'] ?? '',
      needsAction: json['needsAction'] ?? false,
      value: json['value'] ?? '',
      aditionalData: json['aditionalData'] ?? {},
      idCity: json['idCity'],
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
      'value': value,
      'aditionalData': aditionalData,
      'idCity': idCity,
      'idClient': idClient,
    };
  }

  LogEntity copyWith({
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
    return LogEntity(
      idServico: idServico ?? this.idServico,
      idCity: idCity ?? this.idCity,
      idClient: idClient ?? this.idClient,
      idWorker: idWorker ?? this.idWorker,
      message: message ?? this.message,
      needsAction: needsAction ?? this.needsAction,
      value: value ?? this.value,
      aditionalData: aditionalData ?? this.aditionalData,
      dataCreated: dataCreated ?? this.dataCreated,
      id: id ?? this.id,
    );
  }
}
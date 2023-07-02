import '../../core/core.dart';

class DisputaEntity extends Entity {
  final String idServico;
  final String idClient;
  final String idWorker;
  final String message;
  final bool needsAction;
  final DateTime dataCreated;
  final String idCity;
  final Map aditionalData;

  DisputaEntity({
    required super.id,
    required this.idWorker,
    required this.idServico,
    required this.dataCreated,
    required this.message,
    required this.needsAction,
    required this.idClient,
    required this.idCity,
    required this.aditionalData,


  });

  factory DisputaEntity.fromJson(Map<String, dynamic> json) {
    return DisputaEntity(
      id: json['id'] ?? '',
      idWorker: json['idWorker'] ?? '',
      idServico: json['idServico'] ?? '',
      dataCreated: DateUtil.toDateTimeDefaultDateZero(json['dataCreated']),
      message: json['message'] ?? '',
      needsAction: json['needsAction'] ?? false,
      idClient: json['idClient'],
      idCity: json['idCity'],
      aditionalData: json['aditionalData'] ?? {},
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
      'idCity': idCity,
      'aditionalData': aditionalData,
     };
  }

  DisputaEntity copyWith({
    String? id,
    String? idWorker,
    String? idServico,
    DateTime? dataCreated,
    String? message,
    bool? needsAction,
    String? idClient,
    String? idCity,
    Map? aditionalData,

    }) {
    return DisputaEntity(
      id: id ?? this.id,
      idWorker: idWorker ?? this.idWorker,
      idServico: idServico ?? this.idServico,
      dataCreated: dataCreated ?? this.dataCreated,
      message: message ?? this.message,
      needsAction: needsAction ?? this.needsAction,
      idClient: idClient ?? this.idClient,
      idCity: idCity ?? this.idCity,
      aditionalData: aditionalData ?? this.aditionalData,
      );
  }
}

abstract class DisputaRepository extends Repository<DisputaEntity> {}

class DisputaAdapter extends Adapter<DisputaEntity> {
  @override
  DisputaEntity fromJson(Map<String, dynamic> json) {
    return DisputaEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DisputaEntity entity) {
    return entity.toJson();
  }
}

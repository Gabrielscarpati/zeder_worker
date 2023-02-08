import '../../core/core.dart';

class ChatEntity extends Entity {
  final String idCliente;
  final String idPrestador;
  final String ultMsgEnviadaCliente;
  final String ultMsgEnviadaPrestador;
  final int qtdMsgNaoLidaCliente;
  final int qtdMsgNaoLidaPrestador;

  ChatEntity({
    required super.id,
    required this.idCliente,
    required this.idPrestador,
    required this.ultMsgEnviadaCliente,
    required this.ultMsgEnviadaPrestador,
    required this.qtdMsgNaoLidaCliente,
    required this.qtdMsgNaoLidaPrestador,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'] ?? '',
      idCliente: json['idCliente'] ?? '',
      idPrestador: json['idPrestador'] ?? '',
      ultMsgEnviadaCliente: json['ultMsgEnviadaCliente'] ?? '',
      ultMsgEnviadaPrestador: json['ultMsgEnviadaPrestador'] ?? '',
      qtdMsgNaoLidaCliente: IntUtil.toIntDefaultZero(json['qtdMsgNaoLidaCliente']),
      qtdMsgNaoLidaPrestador: IntUtil.toIntDefaultZero(json['qtdMsgNaoLidaPrestador']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idCliente': idCliente,
      'idPrestador': idPrestador,
      'ultMsgEnviadaCliente': ultMsgEnviadaCliente,
      'ultMsgEnviadaPrestador': ultMsgEnviadaPrestador,
      'qtdMsgNaoLidaCliente': qtdMsgNaoLidaCliente,
      'qtdMsgNaoLidaPrestador': qtdMsgNaoLidaPrestador,
    };
  }

  ChatEntity copyWith({
    String? id,
    String? idCliente,
    String? idPrestador,
    String? ultMsgEnviadaCliente,
    String? ultMsgEnviadaPrestador,
    int? qtdMsgNaoLidaCliente,
    int? qtdMsgNaoLidaPrestador,
  }) {
    return ChatEntity(
      id: id ?? this.id,
      idCliente: idCliente ?? this.idCliente,
      idPrestador: idPrestador ?? this.idPrestador,
      ultMsgEnviadaCliente: ultMsgEnviadaCliente ?? this.ultMsgEnviadaCliente,
      ultMsgEnviadaPrestador: ultMsgEnviadaPrestador ?? this.ultMsgEnviadaPrestador,
      qtdMsgNaoLidaCliente: qtdMsgNaoLidaCliente ?? this.qtdMsgNaoLidaCliente,
      qtdMsgNaoLidaPrestador: qtdMsgNaoLidaPrestador ?? this.qtdMsgNaoLidaPrestador,
    );
  }
}

abstract class ChatRepository extends Repository<ChatEntity> {}

class ChatAdapter extends Adapter<ChatEntity> {
  @override
  ChatEntity fromJson(Map<String, dynamic> json) {
    return ChatEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ChatEntity entity) {
    return entity.toJson();
  }
}

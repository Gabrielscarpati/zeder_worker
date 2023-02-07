import '../../core/core.dart';


class ChatMensagemEntity {
  final String id;
  final String idChat;
  final String idProprietario;
  final DateTime dataCriacao;
  final DateTime dataLeitura;

  ChatMensagemEntity({
    required this.id,
    required this.idChat,
    required this.idProprietario,
    required this.dataCriacao,
    required this.dataLeitura,
  });

  factory ChatMensagemEntity.fromJson(Map<String, dynamic> json) {
    return ChatMensagemEntity(
      id: json['id'] ?? '',
      idChat: json['idChat'] ?? '',
      idProprietario: json['idProprietario'] ?? '',
      dataCriacao: DateUtil.toDateTimeDefaultDateZero(json['dataCriacao']),
      dataLeitura: DateUtil.toDateTimeDefaultDateZero(json['dataLeitura']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idChat': idChat,
      'idProprietario': idProprietario,
      'dataCriacao': dataCriacao.toJsonString(),
      'dataLeitura': dataLeitura.toJsonString(),
    };
  }

  ChatMensagemEntity copyWith({
    String? id,
    String? idChat,
    String? idProprietario,
    DateTime? dataCriacao,
    DateTime? dataLeitura,

  }) {
    return ChatMensagemEntity(
      id: id ?? this.id,
      idChat: idChat ?? this.idChat,
      idProprietario: idProprietario ?? this.idProprietario,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataLeitura: dataLeitura ?? this.dataLeitura,
    );
  }
}

import '../../core/core.dart';


class PrazoExecucaoServicoEntity extends Entity {
  final String type;

  PrazoExecucaoServicoEntity._internal({
    required super.id,
    required this.type,
  });
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  factory PrazoExecucaoServicoEntity.ateAmanha(){
    return PrazoExecucaoServicoEntity._internal(id: '1', type: 'No máximo até amanhã');
  }

  factory PrazoExecucaoServicoEntity.seteDias(){
    return PrazoExecucaoServicoEntity._internal(id: '2', type: 'Em até 7 dias');
  }
  factory PrazoExecucaoServicoEntity.trintaDias(){
    return PrazoExecucaoServicoEntity._internal(id: '3', type: 'Em até 30 dias');
  }

  factory PrazoExecucaoServicoEntity.semLimite(){
    return PrazoExecucaoServicoEntity._internal(id: '4', type: 'Não tenho limite de prazo ');
  }


}
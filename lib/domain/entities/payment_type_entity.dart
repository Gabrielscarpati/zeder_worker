import '../../core/core.dart';


class PaymentTypeEntity extends Entity {
  final String type;

  PaymentTypeEntity._internal({
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

  factory PaymentTypeEntity.pix(){
    return PaymentTypeEntity._internal(id: '1', type: 'pix');
  }

  factory PaymentTypeEntity.card(){
    return PaymentTypeEntity._internal(id: '2', type: 'cartao');
  }


}
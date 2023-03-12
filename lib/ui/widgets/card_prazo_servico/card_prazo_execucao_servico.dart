import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/card_prazo_servico/card_prazo_execucao_servico_viewmodel.dart';
import '../../../design_system/widgets/icons.dart';
import '../../../design_system/widgets/text.dart';
import '../../../domain/entities/prazo_execucao_servico_entity.dart';
import '../botoes.dart';

class CardPrazoExecucaoServico extends StatelessWidget {
  final void Function()? SelectCardRadioButtonSecondaryAction;
  final PrazoExecucaoServicoEntity selectedType;
  final void Function(PrazoExecucaoServicoEntity?)? onSelectCardAmanhaRadioButton;
  final void Function(PrazoExecucaoServicoEntity?)? onSelectSeteDiasRadioButton;
  final void Function(PrazoExecucaoServicoEntity?)? onSelectTrintaDiasRadioButton;
  final void Function(PrazoExecucaoServicoEntity?)? onSelectSemLimiteRadioButton;


  const CardPrazoExecucaoServico({Key?key,
    required this.SelectCardRadioButtonSecondaryAction,
    required this.selectedType,
    this.onSelectCardAmanhaRadioButton,
    this.onSelectSeteDiasRadioButton,
    this.onSelectTrintaDiasRadioButton,
    this.onSelectSemLimiteRadioButton,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const DSTextTitleBoldSecondary(text: "Defina o prazo de execução do serviço"),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
              child: Container(
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 36,
                        width: 300,
                        child: RadioButton(title: "No máximo até amanhã", groupValue: selectedType.type,
                          onChanged: (Object? value) {
                            if(value.runtimeType == PrazoExecucaoServicoEntity) {
                              onSelectCardAmanhaRadioButton!(value as PrazoExecucaoServicoEntity);
                            }
                            else {
                              onSelectCardAmanhaRadioButton!(null);
                            }
                          },
                          value: PrazoExecucaoServicoEntity.ateAmanha().type,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      width: 300,
                      child: RadioButton(title: "Em até 7 dias", groupValue: selectedType.type,
                        onChanged: (Object? value) {
                          if(value.runtimeType == PrazoExecucaoServicoEntity) {
                            onSelectSeteDiasRadioButton!(value as PrazoExecucaoServicoEntity);
                          }
                          else {
                            onSelectSeteDiasRadioButton!(null);
                          }
                        },
                        value: PrazoExecucaoServicoEntity.seteDias().type,
                      ),
                    ),

                    SizedBox(
                      height: 36,
                      width: 300,
                      child: RadioButton(title: "Em até 30 dias", groupValue: selectedType.type,
                        onChanged: (Object? value) {
                          if(value.runtimeType == PrazoExecucaoServicoEntity) {
                            onSelectTrintaDiasRadioButton!(value as PrazoExecucaoServicoEntity);
                          }
                          else {
                            onSelectTrintaDiasRadioButton!(null);
                          }
                        },
                        value: PrazoExecucaoServicoEntity.trintaDias().type,
                      ),
                    ),

                    SizedBox(
                      height: 36,
                      width: 300,
                      child: RadioButton(title: "Não tem limite de prao", groupValue: selectedType.type,
                        onChanged: (Object? value) {
                          if(value.runtimeType == PrazoExecucaoServicoEntity) {
                            onSelectSemLimiteRadioButton!(value as PrazoExecucaoServicoEntity);
                          }
                          else {
                            onSelectSemLimiteRadioButton!(null);
                          }
                        },
                        value: PrazoExecucaoServicoEntity.semLimite().type,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
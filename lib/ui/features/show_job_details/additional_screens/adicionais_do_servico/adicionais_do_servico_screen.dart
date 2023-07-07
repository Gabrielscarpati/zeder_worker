import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeder/design_system/design_system.dart';
import '../../../../../application/provider/adicionais_servico.dart';
import '../../../../../design_system/widgets/DsFutureBuilder.dart';
import '../../../../../domain/entities/log_entity.dart';
import '../../../../../domain/entities/servico_entity.dart';
import 'add_adicionais_do_servico.dart';

class AdicionaisDoServicoScreen extends StatelessWidget {

  final ServicoEntity servicoViewModel;
  const AdicionaisDoServicoScreen({Key? key, required this.servicoViewModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdicionaisServicoProvider provider = context.read<AdicionaisServicoProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Adicionais do serviço'), backgroundColor: DSColors.tertiary,),
        body: DSFutureBuilder<List<LogEntity>>(
          future: provider.getLogEntity(idServico: servicoViewModel.id),
          builder: (context,  AsyncSnapshot<List<LogEntity>> snapshot) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  LogEntity log = snapshot.data![index];

                  return ShowLogDetaisListtile(
                    iconName: 'note-multiple-outline',
                    title: log.value,
                    chosenOption: log.message,
                    date: log.dataCreated.toString().substring(0, 10)
                  );
                },
              ),
            ),
          );
        },
        error: 'Você ainda não criou nenhuma\nadicional para este serviço\nainda',
        messageWhenEmpty: "Sem internet...",
      ),

      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(40.0), // Adjust the value as per your preference
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAdicionaisDoServico(servicoViewModel: servicoViewModel,)),
            );
          },
          child: const DSIconFilledPrimaryLarge(iconName: 'plus'),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          color: DSColors.cardColor,
          child: Center(
            child:DSButtonLargePrimary(
              text: 'Voltar',
              onPressed: () {
                /*Navigator.push(
                      context,
                      // professional's lead in this job
                      MaterialPageRoute(builder: (context) => Propostas_service(servico: servico,)),
                    );*/
              },
            ),
          )
      ),
    );
  }
}

class ShowLogDetaisListtile extends StatelessWidget {
  final String iconName;
  final String title;
  final String chosenOption;
  final String date;
  const ShowLogDetaisListtile({Key? key, required this.iconName, required this.title, required this.chosenOption, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DSColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            //maxHeight: 200,
            maxWidth: MediaQuery.of(context).size.width - 74,
            minWidth: MediaQuery.of(context).size.width - 74,
            minHeight: 46,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSIconSecondary(iconName: iconName),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DSTextTitleBoldSecondary(text: title),
                      const SizedBox(width: 32,),
                      DSTextTitleBoldSecondary(text: date),
                    ],
                  ),
                  ConstrainedBox(
                    constraints:  BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 90,
                      minWidth: MediaQuery.of(context).size.width - 90,
                      minHeight: 24,
                    ),
                    child: DSTextTitleSecondary(text: chosenOption)
                  ), //Container widget
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


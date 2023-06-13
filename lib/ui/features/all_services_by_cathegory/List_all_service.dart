import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/features/show_job_details/show_job_details_screen.dart';
import 'package:zeder/ui/widgets/servico/servico_listtile.dart';
import '../../../domain/entities/servico_entity.dart';

class ListAllServiceView extends StatefulWidget {
  final bool allowGetLeads;
  final String title;
  final List<ServicoEntity> servicos;
  const ListAllServiceView({Key? key, required this.servicos, required this.title, required this.allowGetLeads}) : super(key: key);

  @override
  State<ListAllServiceView> createState() => _ListAllServiceViewState();
}

class _ListAllServiceViewState extends State<ListAllServiceView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.scaffoldBackground,
        title: Column(
          children: [
            DSTextTitleSecondary(text:widget.title,),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Divider(
                thickness: 1,
                color: DSColors.tertiary,
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.servicos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only( left: 8.0, right: 8.0),
            child: ServicoListTileHorizontal(
              viewModel: widget.servicos[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowJobDetailsScreen(servicoViewModel: widget.servicos[index], allowGetLeads: widget.allowGetLeads,)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

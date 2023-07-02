import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/servico/servico_listtile.dart';
import '../../../domain/entities/servico_entity.dart';
import '../../device_type.dart';
import '../show_job_details/show_job_details_screen.dart';

class ShowListServicesStandardView extends StatefulWidget {
  final List<ServicoEntity>? servicos;
  final String title;
  final String noServicesFoundTitle;
  final bool allowGetLeads;
  const ShowListServicesStandardView({Key? key, required this.servicos, required this.title, required this.noServicesFoundTitle, required this.allowGetLeads}) : super(key: key);

  @override
  State<ShowListServicesStandardView> createState() => _ShowListServicesStandardViewState();
}

class _ShowListServicesStandardViewState extends State<ShowListServicesStandardView> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding;
    DeviceType deviceType = getDeviceType(MediaQuery.of(context).size.width);
    deviceType == DeviceType.Desktop? padding = (screenWidth-900)/2 : padding = 8;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.scaffoldBackground,
        title: Column(
          children: [
            DSTextTitleSecondary(text: widget.title,),
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
      body: widget.servicos!.isNotEmpty?
      Padding(
        padding: EdgeInsets.only(right: padding, left: padding),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.servicos!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only( left: 8.0, right: 8.0),
              child: ServicoListTileHorizontal(
                viewModel: widget.servicos![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowJobDetailsScreen(servicoViewModel: widget.servicos![index], allowGetLeads: widget.allowGetLeads,)),
                  );
                },
              ),
            );
          },
        ),
      )
          :
       Center(child: DSTextTitleSecondary(text: widget.noServicesFoundTitle),),
    );
  }
}

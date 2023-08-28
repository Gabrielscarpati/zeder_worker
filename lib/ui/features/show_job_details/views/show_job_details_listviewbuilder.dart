import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_job_details/views/show_job_details_Listtitle.dart';

class ShowJobDetailsListviewbuilder extends StatefulWidget {
  final Map<dynamic, dynamic> servicoDetails;
  final String descricao;
  const ShowJobDetailsListviewbuilder(
      {Key? key, required this.servicoDetails, required this.descricao})
      : super(key: key);

  @override
  State<ShowJobDetailsListviewbuilder> createState() =>
      _ShowJobDetailsListviewbuilderState();
}

class _ShowJobDetailsListviewbuilderState
    extends State<ShowJobDetailsListviewbuilder> {
  @override
  void initState() {
    super.initState();
    widget.servicoDetails['Descrição'] = widget.descricao == ""
        ? " O cliente não fez uma descição para esse serviço. "
        : " ${widget.descricao} "; // Add a new key-value pair
  }

  @override
  Widget build(BuildContext context) {
    {
      Map<dynamic, dynamic> details = widget.servicoDetails;
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: details.length,
            itemBuilder: (context, index) {
              String key = details.keys.elementAt(index);
              dynamic value = details[key];

              return ShowJobDetaisListtile(
                iconName: 'notebook-edit',
                title: key,
                chosenOption: formatString(value.toString()),
              );
            },
          ),
        ),
      );
    }
  }

  String formatString(String string) {
    if (string[string.length - 1] == ']') {
      return string.substring(1, string.length - 1);
    } else if (string[string.length - 1] == ']') {
      return string.substring(string.length - 1);
    }
    return string;
  }
}

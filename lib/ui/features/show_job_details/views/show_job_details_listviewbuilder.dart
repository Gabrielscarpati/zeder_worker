import 'package:flutter/cupertino.dart';
import 'package:zeder/ui/features/show_job_details/views/show_job_details_Listtitle.dart';

class ShowJobDetailsListviewbuilder extends StatefulWidget {
  final Map<dynamic, dynamic> servicoDetails;
  const ShowJobDetailsListviewbuilder({Key? key, required this.servicoDetails}) : super(key: key);

  @override
  State<ShowJobDetailsListviewbuilder> createState() => _ShowJobDetailsListviewbuilderState();
}

class _ShowJobDetailsListviewbuilderState extends State<ShowJobDetailsListviewbuilder> {
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
                iconName: 'city',
                title: key,
                chosenOption: value,
              );
            },
          ),
        ),
      );
    }
  }
}

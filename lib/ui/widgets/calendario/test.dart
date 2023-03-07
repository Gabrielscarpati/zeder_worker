import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/calendario/popUp.dart';

import 'DentroDaCell.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key});

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

class _NewCalendarState extends State<NewCalendar> {

  late MeetingDataSource _events;
  late List<Appointment> _shiftCollection;
  bool applicationDeadlines = false;
  bool testDays = false;
  bool showDay = false;

  @override
  void initState() {
    addAppointments();
    _events = MeetingDataSource(_shiftCollection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALENDÁRIO DETONA RABO'),
      ),
      body: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('logo.png'),
                  ),
                ),
                const Text(
                  'Filtar',
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.amber.shade500,
                              value: true,
                              onChanged: ((value) => {
                                applicationDeadlines ? false : true,
                                // print(applicationDeadlines)
                              })
                          ),
                          Text('Datas de Application')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: true,
                              activeColor: Colors.red.shade600,
                              onChanged: ((value) => {
                                testDays ? false : true,
                                print(testDays),
                              })
                          ),
                          Text('Datas de Testes')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: SfCalendar(
              monthCellBuilder: monthCellBuilder,
              allowDragAndDrop: true,
              allowAppointmentResize: true,
              appointmentBuilder: appointmentBuilder,
              view: CalendarView.month,
              // dataSource: CalendarDataSource,
              monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                  agendaViewHeight: 100,
                  // agendaItemHeight: 80
                  appointmentDisplayCount: 2,
                  appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
              ),
              timeSlotViewSettings: const TimeSlotViewSettings(startHour: 9, endHour: 18),
              dataSource: _events,
            ),
          ),
        ],
      ),
    );
  }


  void addAppointments() {

    List<Map<String, Object>> userAppointments = [
      {
        "id": 0, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "sat",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "SAT", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "SAT test day", // add SAT test day for ${student_name} in details
      },
      {
        "id": 1, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "mentoria",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "Mentoria Gabriel", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "Gabriel da a bunda", // add SAT test day for ${student_name} in details
      },
      {
        "id": 2, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "english_lesson",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "Aula de Inglês", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "Aula de inglês semanal com meu pau", // add SAT test day for ${student_name} in details
      },
      {
        "id": 3, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "harvard_deadline",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "Harvard", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "Application deadline for Harvard University", // add SAT test day for ${student_name} in details
      },
      {
        "id": 4, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "princeton_deadline",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "Princeton", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "Application deadline for Princeton University", // add SAT test day for ${student_name} in details
      },
      {
        "id": 5, // id of appoitment => create table that connects appointment IDs to User's id
        "type": "personalized",
        "date": "2023/02/24",
        "duration": 1, // in hours
        "label": "Study for SAT", // SAT: ${"Lucas Kaspary"} should show for instructor based on student ID and NAME
        "details": "Study for SAT", // add SAT test day for ${student_name} in details
      }
    ];

    var appointmentVisual = {
      "sat": {
        "color": Color.fromRGBO(4, 153, 222, 1),
        "image": 'collegeboard.png',
      },
      "mentoria": {
        "color": Colors.red.shade600,
        "image": 'logo.png'
      },
      "english_lesson": {
        "color": Colors.red.shade600, // not dynamic
        "image": 'logo.png' // not dynamic
      },
      "harvard_deadline": {
        "color": Color.fromRGBO(148, 24, 43, 1), // chnage later to a colleges list
        "image": "harvard.png"
      },
      "princeton_deadline": {
        "color": Color.fromRGBO(255, 96, 0, 1), // change later to a colleges list
        "image": 'princeton.png'
      },
      "personalized": {
        "color": Colors.amber.shade500,
        "image": 'logo.png'
      }
    };

    _shiftCollection = <Appointment>[];
    // print((userAppointments[0]["label"]).runtimeType);

    for (int i = 0; i < userAppointments.length; i++) {

      var _subject = (userAppointments[i]["label"]).toString();
      var _color = appointmentVisual[userAppointments[i]["type"]]!["color"] as Color;
      var _image = appointmentVisual[userAppointments[i]['type']]!['image'] as String;
      // int _year = userAppointments[i]["date"]["year"];

      _shiftCollection.add(
          Appointment(
            location: _image,
            id: userAppointments[i]["id"],
            subject: _subject,
            color: _color,
            startTime: DateTime(2023, 02, 24 , 8, 0, 0), // date times missing
            endTime: DateTime(2023, 02, 24 , 9, 0, 0), // date times missing
            startTimeZone: '',
            endTimeZone: '',
          )
      );
    }
  }

}

Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {


  return GestureDetector(
    onTap: (){
      print("aaaaaaaa");
      popUpIncorrectPassword(context);
    },
    child: Container(
      margin: const EdgeInsets.all(0),
     // padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),

      child: Text(
        details.date.day.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.deepOrange, fontSize: 50),
      ),
    ),
  );
}


void popUpIncorrectPassword(context) => showDialog(
  context: context,
  builder: (context) => const PopUpIncorrectPassword(),
);

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> shiftCollection) {
    appointments = shiftCollection;
  }
}

Widget appointmentBuilder(BuildContext context, CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  return DentroDaCell(context: context, calendarAppointmentDetails: calendarAppointmentDetails, appointment: appointment,);
}
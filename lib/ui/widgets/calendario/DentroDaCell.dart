import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DentroDaCell extends StatelessWidget {
  final BuildContext context;
  final Appointment appointment;
  final CalendarAppointmentDetails calendarAppointmentDetails;
  const DentroDaCell({Key? key, required this.context, required this.calendarAppointmentDetails, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appointment.color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  (appointment.location).toString(), // find a way of assing this to the appointment variable
                ),
              ),
              Text(
                appointment.subject,
                textAlign: TextAlign.left,
                style:
                TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


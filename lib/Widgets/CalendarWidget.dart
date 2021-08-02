import 'package:flutter/material.dart';
import 'package:lawyer_assist/screens/Calendar_Page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
    );
  }
}

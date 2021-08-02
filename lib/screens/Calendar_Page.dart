import 'package:flutter/material.dart';
import 'package:lawyer_assist/Widgets/CalendarWidget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



class CalendarPageView extends StatefulWidget {
  const CalendarPageView({Key? key}) : super(key: key);

  @override
  _CalendarPageViewState createState() => _CalendarPageViewState();
}

class _CalendarPageViewState extends State<CalendarPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
        centerTitle: true,
      ),
      body: CalendarWidget(),
    );
  }
}


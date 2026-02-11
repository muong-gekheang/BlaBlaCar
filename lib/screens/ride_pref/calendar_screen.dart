import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: BlaColors.primary, size: 32,),
            ),
            Text('When are you going?', style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark)),
            TableCalendar(
              focusedDay: _focusedDay,
              enabledDayPredicate: (day) {
                return !day.isBefore(
                  DateTime(today.year, today.month, today.day),
                );
              },
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              firstDay: DateTime(2026, 2, 1),
              lastDay: DateTime(2026, 12, 31),
              onDaySelected: (selectedDay, focusedDay) {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
      
                Navigator.pop(context, selectedDay);
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart'; // Event class for events

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create some sample events
    var markedDates = [
      Event(
        date: DateTime(2024, 12, 10), // Example date
        title: 'Event 1',
        dot: Container(
          height: 5.0,
          width: 5.0,
          color: Colors.red,
        ),
      ),
      Event(
        date: DateTime(2024, 12, 10), // Another event on the same date
        title: 'Event 2',
        dot: Container(
          height: 5.0,
          width: 5.0,
          color: Colors.green,
        ),
      ),
      Event(
        date: DateTime(2024, 12, 15), // Another event on a different date
        title: 'Event 3',
        dot: Container(
          height: 5.0,
          width: 5.0,
          color: Colors.blue,
        ),
      ),
    ];

    // Group the events by date (Map<DateTime, List<Event>>)
    Map<DateTime, List<Event>> markedDateMap = {};
    for (var event in markedDates) {
      if (markedDateMap.containsKey(event.date)) {
        markedDateMap[event.date]?.add(event);
      } else {
        markedDateMap[event.date] = [event];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Center(
        child: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            print('Pressed day: ${date.day}');
            // You can handle more logic based on the date pressed
          },
          weekendTextStyle: const TextStyle(
            color: Colors.red,
          ),
          headerTextStyle: const TextStyle(
            color: Colors.blue,
          ),
          showHeader: true,
          markedDatesMap: EventList<Event>(  // Use EventList<Event> here
            events: markedDateMap,  // Pass the map here
          ),
        ),
      ),
    );
  }
}

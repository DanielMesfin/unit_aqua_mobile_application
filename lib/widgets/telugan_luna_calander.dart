import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/views/info/info_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LunarCalendarScreen extends StatefulWidget {
  const LunarCalendarScreen({super.key});

  @override
  _LunarCalendarScreenState createState() => _LunarCalendarScreenState();
}

class _LunarCalendarScreenState extends State<LunarCalendarScreen> {
  List<Map<String, dynamic>> lunarEvents = [];

  int? initiallyExpandedIndex;

  @override
  void initState() {
    final controller = Get.put(InfoController());
    List<Map<String, dynamic>> convertedList =
        controller.eventsList.map((event) {
      return event as Map<String, dynamic>;
    }).toList();
    lunarEvents = convertedList;
    super.initState();
    _calculateInitialExpansion();
  }

  void _calculateInitialExpansion() {
    final currentDate = DateTime.now();
    int closestIndex = -1;
    int shortestDifference = double.maxFinite.toInt();

    for (int i = 0; i < lunarEvents.length; i++) {
      final eventDate = DateTime.parse(lunarEvents[i]['date']);
      final difference = eventDate.difference(currentDate).inDays;

      if (difference >= 0 && difference < shortestDifference) {
        shortestDifference = difference;
        closestIndex = i;
      }
    }

    setState(() {
      initiallyExpandedIndex = closestIndex >= 0 ? closestIndex : null;
    });
  }

  int calculateDaysLeft(String eventDate) {
    final currentDate = DateTime.now();
    final targetDate = DateTime.parse(eventDate);
    return targetDate.difference(currentDate).inDays;
  }

  List<Map<String, dynamic>> getUpcomingEvents() {
    final currentDate = DateTime.now();
    return lunarEvents
        .where((event) =>
            DateTime.parse(event['date']).isAfter(currentDate) ||
            DateTime.parse(event['date']).isAtSameMomentAs(currentDate))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final upcomingEvents = getUpcomingEvents();

    if (upcomingEvents.isEmpty) {
      return Card(
        color: Colors.white70,
        child: Text(
          "No event soon",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Card(
      color: Colors.white70,
      elevation: 2,
      shadowColor: Colors.blue,
      margin: EdgeInsets.symmetric(vertical: 0.0),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpandedIndex != null &&
            initiallyExpandedIndex! < upcomingEvents.length,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.solidStar,
                        size: 20, color: CustomColors.primaryColor),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      upcomingEvents[0]['name'],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  calculateDaysLeft(upcomingEvents[0]['date']) > 0
                      ? '${calculateDaysLeft(upcomingEvents[0]['date'])} Days left'
                      : 'Today!',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Date: ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(upcomingEvents[0]['date']))}',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        children: [
          Divider(),
          Center(
              child: Text("Next Events",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          ...upcomingEvents.skip(1).map((event) {
            final daysLeft = calculateDaysLeft(event['date']);
            final formattedDate = DateFormat('MMMM dd, yyyy')
                .format(DateTime.parse(event['date']));
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.cloudMoon,
                                  size: 20, color: CustomColors.primaryColor),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                event['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            daysLeft > 0 ? '$daysLeft Days left' : 'Today!',
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            'Date: $formattedDate',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

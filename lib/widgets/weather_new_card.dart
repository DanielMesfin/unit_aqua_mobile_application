import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherNewCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherNewCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '${weatherData['location']['name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: Card(
                    elevation: 2,
                    color: Colors.blue.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 2,
                              child: Image.network(
                                'https:${weatherData['current']['condition']['icon']}',
                                width: 20,
                                height: 20,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                            ),
                            ListTile(
                              title: Text("To Day",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10)),
                              subtitle: Text(
                                ' ${weatherData['current']['condition']['text']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 10),
                              ),
                              trailing: Text(
                                ' ${weatherData['current']['temp_c']} °C',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) {
                return SizedBox(
                  width: 200,
                  child: Card(
                    elevation: 2,
                    color: Colors.blue.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 2,
                              child: Image.network(
                                'https:${weatherData['forecast']['forecastday'][index]['day']['condition']['icon']}',
                                width: 20,
                                height: 20,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                DateFormat('MMM dd')
                                    .format(DateTime.parse(
                                        weatherData['forecast']['forecastday']
                                            [index]['date']))
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w200, fontSize: 10),
                              ),
                              subtitle: Text(
                                '${weatherData['forecast']['forecastday'][index]['day']['condition']['text']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 10),
                              ),
                              trailing: Text(
                                '${weatherData['forecast']['forecastday'][index]['day']['avgtemp_f']} °C',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

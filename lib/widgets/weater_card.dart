import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/themes/custom_colors.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherCard({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      elevation: 2,
      shadowColor: Colors.blue,
      child: ExpansionTile(
        title: Stack(
          children: [
            Positioned(
              right: 0,
              top: 2,
              child: Image.network(
                'https:${weatherData['current']['condition']['icon']}',
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback for loading errors
                  return Icon(Icons.error);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: CustomColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Location: ${weatherData['location']['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: CustomColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Temperature: ${weatherData['current']['temp_c']} °C',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: CustomColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Weather: ${weatherData['current']['condition']['text']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: CustomColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Precipitation: ${weatherData['current']['precip_mm']} mm',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Divider(),
                Center(
                  child: Text(
                    'Next 3 Days Forecast',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(children: [
                  Divider(),
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 2,
                        child: Image.network(
                          'https:${weatherData['forecast']['forecastday'][0]['day']['condition']['icon']}',
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback for loading errors
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.circle, size: 10, color: Colors.grey),
                        title: Text(
                          DateFormat('MMMM dd, yyyy')
                              .format(DateTime.parse(weatherData['forecast']
                                  ['forecastday'][0]['date']))
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 15),
                        ),
                        subtitle: Text(
                          'Weather: ${weatherData['forecast']['forecastday'][0]['day']['condition']['text']}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        trailing: Text(
                          '${weatherData['forecast']['forecastday'][0]['day']['avgtemp_f']} °C',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 2,
                        child: Image.network(
                          'https:${weatherData['forecast']['forecastday'][1]['day']['condition']['icon']}',
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback for loading errors
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.circle, size: 10, color: Colors.grey),
                        title: Text(
                          DateFormat('MMMM dd, yyyy')
                              .format(DateTime.parse(weatherData['forecast']
                                  ['forecastday'][1]['date']))
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 15),
                        ),
                        subtitle: Text(
                          'Weather: ${weatherData['forecast']['forecastday'][1]['day']['condition']['text']}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        trailing: Text(
                          '${weatherData['forecast']['forecastday'][1]['day']['avgtemp_f']} °C',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 2,
                        child: Image.network(
                          'https:${weatherData['forecast']['forecastday'][2]['day']['condition']['icon']}',
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback for loading errors
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.circle, size: 10, color: Colors.grey),
                        title: Text(
                          DateFormat('MMMM dd, yyyy')
                              .format(DateTime.parse(weatherData['forecast']
                                  ['forecastday'][2]['date']))
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 15),
                        ),
                        subtitle: Text(
                          'Weather: ${weatherData['forecast']['forecastday'][2]['day']['condition']['text']}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        trailing: Text(
                          '${weatherData['forecast']['forecastday'][2]['day']['avgtemp_f']} °C',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

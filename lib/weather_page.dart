import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/additional_info.dart';
import 'package:weatherapp/secrets.dart';

import 'hourly_forecast_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeatherScreen();
  }
}

class _WeatherScreen extends State {
  late double temp = 0.0;
  late Future<Map<String,dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = "London";

      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey",
        ),
      );

      final data = jsonDecode(res.body);
      if (data['cod'] != "200") {
        throw "An unexpected error occurred";
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
     weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          setState(() {
            weather = getCurrentWeather();
          });
        }, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data;
          final currentWeatherData = data?['list'][0];
          final currentTemperature = currentWeatherData['main']["temp"];
          final currentSky = currentWeatherData['weather'][0]["main"];
          final currentWindSpeed = currentWeatherData['wind']["speed"];
          final currentWindHumidity = currentWeatherData['main']["humidity"];
          final currentWindPressure = currentWeatherData['main']["pressure"];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main Card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemperature K",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 48,
                              ),
                              const SizedBox(height: 16),

                              Text(
                                "$currentSky",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                //weather forecast card
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                      itemBuilder: (context, index) {
                      final hourlyForecast =  data!["list"][index+1];
                      final time = DateTime.parse( hourlyForecast['dt_txt']);
                      return  HourlyForecastItem(
                          temperature:hourlyForecast["main"]["temp"].toString(),
                          iconData:  hourlyForecast['weather'][0]["main"] =="Clouds"||hourlyForecast['weather'][0]["main"]=="Rain" ? Icons.cloud:Icons.sunny,
                          time: DateFormat.j().format(time),
                        );


                  }),
                ),

                Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                //additional information
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      lable: "Humidity",
                      value: "$currentWindHumidity",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      lable: "Wind Speed",
                      value: "$currentWindSpeed",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      lable: "Pressure",
                      value: "$currentWindPressure",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

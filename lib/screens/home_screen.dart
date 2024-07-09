import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/services/utils/api_url.dart';
import 'package:weather_app/widgets/search_bar.dart';

String baseurl1 =
    'https://api.openweathermap.org/data/2.5/weather?q=Siliguri&appid=$appid&units=metric';

Future<WeatherModel>? fetchdata;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String enterredtext = '';
  Future<WeatherModel>? fetchdata;

  @override
  void initState() {
    super.initState();
    fetchdata = ApiServices().getApi();
  }

  void onClick(String text) {
    if (text.trim().isNotEmpty) {
      baseurl1 =
          'https://api.openweathermap.org/data/2.5/weather?q=$text&appid=$appid&units=metric';
      Future.delayed(
        const Duration(seconds: 8),
        () {
          setState(() {
            fetchdata = ApiServices().getApi1();
          });
        },
      );
    }
  }

  TextStyle textStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchdata,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final image = snapshot.data!.weather![0].icon;
            final double windSpeed = snapshot.data!.wind!.speed! * 3.6;
            final des = snapshot.data!.weather![0].description;
            var des1 = des![0].toUpperCase() + des.substring(1);
            return SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Searchbar(
                          color: Colors.white,
                          onTextChanged: (value) {
                            enterredtext = value;
                          },
                          onClick: () {
                            onClick(enterredtext);
                          },
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 125,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.lightBlue.shade200,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 180,
                                width: 100,
                                child: Image.network(
                                  'https://openweathermap.org/img/wn/$image@2x.png',
                                ),
                              ),
                              Text(
                                '$des1\nIn ${snapshot.data!.name}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(136, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.lightBlue.shade200,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.thermostat,
                                    size: 50,
                                    color: Color.fromARGB(92, 0, 0, 0),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${snapshot.data!.main!.temp!.toStringAsFixed(2)}°C',
                                    style: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(136, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.lightBlue.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(
                                        Icons.wind_power,
                                        size: 30,
                                        color: Color.fromARGB(92, 0, 0, 0),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: Text(
                                        '${windSpeed.toStringAsFixed(2)}\nkm/hr',
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(136, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.lightBlue.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(
                                        Icons.water_drop,
                                        size: 30,
                                        color: Color.fromARGB(92, 0, 0, 0),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: Text(
                                        '${snapshot.data!.main!.humidity}\nPercent',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(136, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Made by Sumit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Data Provided By openweathermap.org',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Searchbar(
                        color: Colors.transparent,
                        onTextChanged: (value) {
                          enterredtext = value;
                        },
                        onClick: () {
                          onClick(enterredtext);
                        },
                      ),
                      const SizedBox(height: 130),
                      const Icon(
                        Icons.sunny_snowing,
                        size: 130,
                      ),
                      const SizedBox(height: 60),
                      const Text(
                        'Fetching Data...',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const SpinKitWave(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

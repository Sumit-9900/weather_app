import 'package:flutter_dotenv/flutter_dotenv.dart';

final appid = dotenv.env['appid'];

String baseurl =
    'https://api.openweathermap.org/data/2.5/weather?q=Siliguri&appid=$appid&units=metric';

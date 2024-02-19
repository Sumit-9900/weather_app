import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/api_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/utils/api_url.dart';

class ApiServices {
  Future<WeatherModel> getApi() async {
    try {
      final Uri url = Uri.parse(baseurl);
      // print(url);
      final res = await http.get(url);
      // print(res);
      Map<String, dynamic> data = jsonDecode(res.body);
      // print(data);
      // print(WeatherModel.fromJson(data));
      return WeatherModel.fromJson(data);
    } on SocketException catch (e) {
      throw Exception('No Internet Connectivity!');
    } on HttpException catch (e) {
      throw Exception('HttpException Ocurred!');
    } on FormatException catch (e) {
      throw Exception('FormatException Ocurred!');
    } on TimeoutException catch (e) {
      throw Exception('TimeoutException Ocurred!');
    } catch (e) {
      throw Exception('Exception Ocurred :- $e');
    }
  }

  Future<WeatherModel> getApi1() async {
    try {
      final Uri url = Uri.parse(baseurl1);
      // print(url);
      final res = await http.get(url);
      // print(res);
      Map<String, dynamic> data = jsonDecode(res.body);
      // print(data);
      // print(WeatherModel.fromJson(data));
      return WeatherModel.fromJson(data);
    } on SocketException catch (e) {
      throw Exception('No Internet Connectivity!');
    } on HttpException catch (e) {
      throw Exception('HttpException Ocurred!');
    } on FormatException catch (e) {
      throw Exception('FormatException Ocurred!');
    } on TimeoutException catch (e) {
      throw Exception('TimeoutException Ocurred!');
    } catch (e) {
      throw Exception('Exception Ocurred :- $e');
    }
  }
}

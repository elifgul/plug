import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static String environment;
  static Map<String, dynamic> _config;

  static Future<void> initialize(String env) async {
    environment = env;
    final configString =  await rootBundle.loadString('assets/config/app_config_$env.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getApiUrl() {
    return _config['hysApiUrl'] as String;
  }

  static int getSyncronTimer() {
    return _config['syncronTimer'];
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plug/service/ihale_service.dart';

import 'app.dart';
import 'config/config_reader.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize(env);
  await IhaleApi.fetchIhaleList();
  runApp(
    Provider.value(
      value: null,
      child: PlugApp(),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plug/core/service/ihale_service.dart';

import 'presentation/page/app.dart';
import 'core/config/config_reader.dart';
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
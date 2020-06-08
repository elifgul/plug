import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/config_reader.dart';
import 'feature/presentation/page/app.dart';
import 'injection_container.dart' as inject;

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init();
  await ConfigReader.initialize(env);
  runApp(
    Provider.value(
      value: null,
      child: PlugApp(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:test_app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const App());
}

import 'package:first_flutter_project/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'fs/tataplay_fs.dart';

void main() {
  logAppStartInfo();
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  runApp(const TataPlayFS());
}

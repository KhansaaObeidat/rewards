import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rewards_app/utils/hive_constant.dart';
import 'package:rewards_app/utils/logger.dart';

import 'app.dart';

Future<void> main() async {
    logInformationMessage("Application Started ... ");
     WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox(DatabaseBoxConstant.storage);
SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    runApp(const MyApp());

}


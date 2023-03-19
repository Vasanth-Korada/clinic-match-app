import 'package:clinic_match_app/common/color_scheme.dart';
import 'package:clinic_match_app/constants/strings.dart';
import 'package:clinic_match_app/core/navigation/navigation_service.dart';
import 'package:clinic_match_app/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
  await FirebaseCrashlytics.instance.sendUnsentReports();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.clinicMatch,
      navigatorObservers: [routeObserver],
      navigatorKey: NavigationService.navigationKey,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const OnBoarding(),
    );
  }
}

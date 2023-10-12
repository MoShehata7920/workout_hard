import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_hard/provider/exercise_provider.dart';
import 'package:workout_hard/provider/workout_provide.dart';
import 'package:workout_hard/resources/routes_manager.dart';
import 'package:workout_hard/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExerciseData()),
        ChangeNotifierProvider(create: (context) => WorkOutData()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xFF00001a)),
        debugShowCheckedModeBanner: false,
        title: 'Workout Hard',
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        home: const SplashScreen(),
      ),
    );
  }
}

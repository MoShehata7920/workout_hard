import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/screens/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF00001a),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImageAssets.menu,
                width: 20,
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.profile),
              ),
            ),
          ],
        ),
        body: const HomeBody());
  }
}

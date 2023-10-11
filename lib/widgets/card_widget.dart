import 'package:flutter/material.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/resources/strings_manager.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.cardImage,
      required this.trainTime,
      required this.numOfExercises,
      required this.cost,
      required this.isTopRated,
      required this.trainerName});
  final String cardImage, trainerName;
  final double trainTime;
  final int numOfExercises, cost;
  final bool isTopRated;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              cardImage,
            ),
          ),
        ),
        Positioned(
          width: 250,
          top: 15,
          left: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$trainTime ${AppStrings.hours}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$numOfExercises ${AppStrings.exercises}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$$cost',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              isTopRated
                  ? Image.asset(
                      ImageAssets.medal,
                      width: 50,
                    )
                  : const Text('')
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Text(
            trainerName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
        )
      ],
    );
  }
}

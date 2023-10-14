import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_hard/models/exercise_model.dart';
import 'package:workout_hard/models/workout_model.dart';
import 'package:workout_hard/provider/exercise_provider.dart';
import 'package:workout_hard/provider/workout_provide.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/resources/icons_manager.dart';
import 'package:workout_hard/screens/details_screen/details_screen_body.dart';

class DetailsScreen extends StatefulWidget {
  final Object? workOutId;

  const DetailsScreen(this.workOutId, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  DetailsScreenState createState() => DetailsScreenState(workOutId as int);
}

class DetailsScreenState extends State<DetailsScreen> {
  int workOutId;
  DetailsScreenState(this.workOutId);

  late VideoPlayerController _videoController;
  var isInit = true;
  late WorkOut workout;
  late Exercise exercise;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      try {
        workout = Provider.of<WorkOutData>(context, listen: false)
            .findById(workOutId);
        exercise = Provider.of<ExerciseData>(context, listen: false)
            .findById(workOutId);
      } catch (e) {
        final logger = Logger();
        logger.e(e.toString());
      }
    }
    setState(() {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(workout.videoUrl),
      )..initialize().then((_) {
          setState(
            () {},
          );
        });
    });
    _videoController.setLooping(true);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: pauseAndPlayVideoButton(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    AppIcons.arrowBack,
                    color: Colors.cyan,
                  ),
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: workout.isTopRated
                  ? Image.asset(
                      ImageAssets.medal,
                      width: 30,
                    )
                  : const Text(''),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: DetailsScreenBody(
          workoutImage: workout.imageUrl,
          trainerName: workout.trainer,
          workoutTitle: workout.title,
          workoutDescription: workout.description,
          controller: _videoController,
          exercise: exercise,
        ));
  }

  Widget pauseAndPlayVideoButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF00453D),
      foregroundColor: Colors.white,
      child: Icon(
        _videoController.value.isPlaying ? AppIcons.pause : AppIcons.playArrow,
      ),
      onPressed: () {
        setState(
          () {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}

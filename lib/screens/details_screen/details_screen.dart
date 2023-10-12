import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_hard/models/exercise_model.dart';
import 'package:workout_hard/models/workout_model.dart';
import 'package:workout_hard/provider/exercise_provider.dart';
import 'package:workout_hard/provider/workout_provide.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  var isFetched = false;
  late WorkOut workout;
  late Exercise exercise;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      try {
        var data =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        var id = data['id'] as int;
        workout = Provider.of<WorkOutData>(context, listen: false).findById(id);
        exercise =
            Provider.of<ExerciseData>(context, listen: false).findById(id);
      } catch (e) {
        // ignore: avoid_print
        print('error');
      }
    }
    setState(() {
      _videoController = VideoPlayerController.networkUrl(
        workout.videoUrl,
      )..initialize().then((_) {
          setState(
            () {},
          );
        });
    });
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _videoController.initialize();

    // Use the controller to loop the video.
    _videoController.setLooping(true);

    print('VIDEO URL: ' + workout.videoUrl);

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
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : _videoController.play();
            },
          );
        },
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
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
                  Icons.arrow_back,
                  color: Colors.purple,
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
                    'assets/images/medal.png',
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
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  workout.imageUrl,
                ),
              ),
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            minHeight: 80,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            panelBuilder: (ScrollController sc) => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.trainer,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          workout.imageUrl,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workout.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Coach')
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    workout.description,
                    textAlign: TextAlign.justify,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          // VIDEO
                          Center(
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  // If the VideoPlayerController has finished initialization, use
                                  // the data it provides to limit the aspect ratio of the video.
                                  return AspectRatio(
                                    aspectRatio:
                                        _videoController.value.aspectRatio,
                                    // Use the VideoPlayer widget to display the video.
                                    child: VideoPlayer(_videoController),
                                  );
                                } else {
                                  // If the VideoPlayerController is still initializing, show a
                                  // loading spinner.
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          //

                          const Divider(),
                          customListTile('Squat', exercise.squat),
                          const Divider(),
                          customListTile('Leg Press', exercise.legPress),
                          const Divider(),
                          customListTile('Lunge', exercise.lunge),
                          const Divider(),
                          customListTile(
                              'Leg Extension', exercise.legExtension),

                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.purple,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                              ),
                              onPressed: null,
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customListTile(String title, String duration) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        duration,
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:quran2/data.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, required this.source}) : super(key: key);

  final Source source;
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = AudioPlayer();
  final playerCache = AudioCache();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.PLAYING;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onAudioPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.source.name),
            backgroundColor: Colors.teal,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(
                    widget.source.img,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.source.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Slider.adaptive(
                  min: 0,
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                    await player.resume();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(position.toString().split('.').first),
                    const Spacer(),
                    Text(formatTime(duration)),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: IconButton(
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () async {
                            final posi = position + Duration(seconds: -10);
                            await player.seek(posi);
                            await player.resume();
                          },
                          icon: const Icon(Icons.fast_rewind)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: IconButton(
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () async {
                            if (isPlaying) {
                              await player.pause();
                            } else {
                              await player.resume();
                            }
                          },
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: IconButton(
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () async {
                            final posi = position + Duration(seconds: 10);
                            await player.seek(posi);
                            await player.resume();
                          },
                          icon: const Icon(Icons.fast_forward)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void setAudio() async {
    final pl = AudioCache(prefix: 'assets/');
    final url = await pl.load(widget.source.src);

    player.setUrl(url.path, isLocal: true);
  }

  String formatTime(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

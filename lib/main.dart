import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran2/data.dart';
import 'package:quran2/screens/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(
            title: "Nasser Alqatami - Rewayat Hafs A\'n Assem"),
        // '/player': (context) => const PlayerScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:
      //     const MyHomePage(title: 'Nasser Alqatami - Rewayat Hafs A\'n Assem'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.teal,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: sources.length,
          itemBuilder: (context, index) => ListTile(
            // leading: Icon(Icons.book_online),
            trailing: const Icon(Icons.play_arrow),
            title: Text('${sources[index].name}'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(source: sources[index]),
                ),
              ),
            },
          ),
        ));
  }
}

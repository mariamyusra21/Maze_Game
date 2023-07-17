import 'package:flutter/material.dart';
import 'package:maze/maze.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 145, 12, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 119, 11, 1),
        centerTitle: true,
        title: Text(
          'Maze Game',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Maze(
        player: MazeItem('assets/player.png', ImageType.asset),
        wallColor: Colors.white,
        wallThickness: 8.0,
        rows: 15,
        columns: 15,
        finish: MazeItem('assets/finish.png', ImageType.asset),
        onFinish: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(
                    "You Won!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "You have completed the maze!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()));
                        },
                        child: Text("Okay"))
                  ],
                );
              });
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MusicPlayerCard());
}

class MusicPlayerCard extends StatefulWidget {
  const MusicPlayerCard({super.key});

  @override
  State<MusicPlayerCard> createState() => _MusicPlayerCardState();
}

class _MusicPlayerCardState extends State<MusicPlayerCard> {
  double _sliderValue = 0;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_downward_sharp),
          actions: [Icon(Icons.menu)],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Icon(Icons.music_note, size: 64, color: Colors.black),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Song Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text("Artist", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                  Icon(Icons.settings),
                ],
              ),
              Slider(
                value: _sliderValue,
                onChanged: (value) => setState(() {
                  _sliderValue = value;
                }),
                min: 0,
                max: 1,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Icon(Icons.shuffle),
                    Icon(Icons.play_circle),
                    Icon(Icons.repeat),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Icon(Icons.speaker), Icon(Icons.star)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

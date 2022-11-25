import 'package:audio_player/songpage.dart';
import 'package:audio_player/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'songpage': (context) => const SongPage(),
      },
    ),
  );
}

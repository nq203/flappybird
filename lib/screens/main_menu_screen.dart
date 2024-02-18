
import 'package:flutter/material.dart';

import '../game/assets.dart';
import '../game/flappy_bird.dart';
class MainMenuScreen extends StatelessWidget {
  static const String id = 'mainMenu';
  final FlappyBird game;
  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.menu),
                fit: BoxFit.cover,
            )
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}

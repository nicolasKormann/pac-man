import 'package:bonfire/bonfire.dart';
import 'package:bonfire/joystick/joystick.dart';
import 'package:bonfire/tiled/tiled_world_map.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/enemies/ghost1.dart';
import 'package:pacman_game/enemies/ghost2.dart';
import 'package:pacman_game/player.dart';

const double tileSize = 32;

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
          keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.arrows)),
      map: TiledWorldMap(
        'map.json',
        forceTileSize: const Size(32, 32),
      ),
      player: PacPlayer(Vector2(310, 450)),
      showCollisionArea: true,
      components: [
        GhostEnemy1(Vector2(272, 285)),
        GhostEnemy1(Vector2(346, 285)),
      ],
    );
  }
}

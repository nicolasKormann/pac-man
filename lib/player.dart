import 'package:bonfire/bonfire.dart';
import 'package:flutter/rendering.dart';
import 'package:pacman_game/player_sprite.dart';

class PacPlayer extends SimplePlayer with ObjectCollision {
  PacPlayer(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          life: 10,
          speed: 95,
          initDirection: Direction.left,
          
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(32, 32),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 1,
      height: 2,
      align: const Offset(0, 0),
    );
    super.render(canvas);
  }

  @override
  void die() async {
    removeFromParent();
    final sprite = await PlayerSpriteSheet.die;
    gameRef.add(
      GameDecoration.withSprite(
        sprite: sprite.getSprite(),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.die();
  }
}

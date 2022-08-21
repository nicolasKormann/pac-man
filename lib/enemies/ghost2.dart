import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/enemies/ghost2_srpite.dart';

class GhostEnemy2 extends SimpleEnemy with ObjectCollision {
  GhostEnemy2(Vector2 position)
      : super(
          position: position,
          size: Vector2(32.0, 32.0),
          speed: 90,
          initDirection: Direction.up,
          animation: EnemySpriteSheet2.simpleDirectionAnimation,
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
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 100,
          size: Vector2(16, 16),
          direction: lastDirection,
          withPush: true,
        );
      },
      radiusVision: 96,
    );
    super.update(dt);
  }
}

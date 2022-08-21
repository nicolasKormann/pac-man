import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/enemies/ghost1_srpite.dart';

class GhostEnemy1 extends SimpleEnemy with ObjectCollision {
  GhostEnemy1(Vector2 position)
      : super(
          position: position,
          size: Vector2(32.0, 32.0),
          speed: 100,
          animation: EnemySpriteSheet.simpleDirectionAnimation,
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
          size: Vector2(1, 1),
          direction: lastDirection,
          withPush: false,
        );
      },
      radiusVision: 96,
    );

    super.update(dt);
  }
}

import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet2 {

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemies/ghost2/moving_right.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );  

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "enemies/ghost2/moving_left.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "enemies/ghost2/moving_up.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "enemies/ghost2/moving_down.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        runLeft: runLeft,
        idleRight: runRight,
        runRight: runRight,
        runUp: runUp,
        runDown: runDown,
      );
}

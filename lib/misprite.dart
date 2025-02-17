import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';

// Lógica pulsación
class Misprite extends SpriteAnimationComponent with KeyboardHandler {
  Misprite() : super(size: Vector2.all(50));

  double posicionX = 0;
  double velocidad = 200;
  double posicionY = 0;
  final double spriteSheetWith = 405;
  final double spriteSheetHeight = 534;
  late SpriteAnimation calabazaWalk;
  late SpriteAnimation calabazaIdle;
  bool derecha = true;

  @override
  FutureOr<void> onLoad() async {
    anchor = Anchor.center;
    calabazaIdle = await crearAnimacion(
        'calabaza_idle.png', spriteSheetWith, spriteSheetHeight, 2, 5);
    calabazaWalk = await crearAnimacion(
        'calabaza_walk.png', spriteSheetWith, spriteSheetHeight, 2, 5);
    animation = calabazaIdle;
    return super.onLoad();
  }

  Future<SpriteAnimation> crearAnimacion(
      String ruta, double ancho, double alto, int numFilas, int numColumnas) async {
    final spriteImage = await Flame.images.load(ruta);
    final spriteSheet =
        SpriteSheet(image: spriteImage, srcSize: Vector2(ancho, alto));

    List<Sprite> sprites = [];
    for (int i = 0; i < numFilas; i++) {
      for (int j = 0; j < numColumnas; j++) {
        sprites.add(spriteSheet.getSprite(i, j));
      }
    }
    return SpriteAnimation.spriteList(sprites, stepTime: 0.5);
  }

  @override
  void update(double dt) {
    position.y = 300;
    position.x += velocidad * dt * posicionX;
    posicionX = 0; // Resetear para evitar acumulación de velocidad
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      animation = calabazaWalk;
      if (derecha) {
        flipHorizontally();
        derecha = false;
      }
      posicionX = -1; // Mover hacia la izquierda
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      animation = calabazaWalk;
      if (!derecha) {
        flipHorizontally();
        derecha = true;
      }
      posicionX = 1; // Mover hacia la derecha
    } else if (keysPressed.isEmpty) {
      animation = calabazaIdle;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}


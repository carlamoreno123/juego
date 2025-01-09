import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
 //logica pulsacion
class Misprite extends SpriteComponent with KeyboardHandler{
  Misprite() : super(size: Vector2.all(50));

  double posicionX = 0;
  
  double posicionY = 0;

  @override
  FutureOr<void> onLoad()async {
    sprite = await Sprite.load('lapida-sepulcral.png');
    return super.onLoad();
  }
  @override
  void update(double dt) {
    
    super.update(dt);
  }
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
   if(keysPressed.contains(LogicalKeyboardKey.arrowDown)){
    position = Vector2(posicionX, posicionY+=10, );
   }
      if(keysPressed.contains(LogicalKeyboardKey.arrowUp)){
    position = Vector2(posicionX, posicionY-=10, );
   }
      if(keysPressed.contains(LogicalKeyboardKey.arrowLeft)){
    position = Vector2(posicionX-=10, posicionY, );
   }
      if(keysPressed.contains(LogicalKeyboardKey.arrowRight)){
    position = Vector2(posicionX+=10, posicionY, );
   }

   
    return super.onKeyEvent(event, keysPressed);
  }

}
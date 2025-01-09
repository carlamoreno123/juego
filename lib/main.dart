import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:miprimerjuego/micanvas.dart';
import 'package:miprimerjuego/misprite.dart';
//teclas
class MyGame extends FlameGame with KeyboardEvents, HasKeyboardHandlerComponents{
  @override
  FutureOr<void> onLoad() {
    add(MiCanvas());
   add(Misprite());
    return super.onLoad();
  }
  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    return super.onKeyEvent(event, keysPressed);
  }
}




void main() {
  runApp(GameWidget(game: MyGame()));
}


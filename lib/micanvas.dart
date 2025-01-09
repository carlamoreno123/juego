import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class MiCanvas extends PositionComponent{
  @override
  void render(Canvas canvas) {
    canvas.drawCircle(Offset(100, 100),80, BasicPalette.darkPink.paint());
   

    super.render(canvas);
  }
  

}
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Draws a pin at twice its display size for sharp native annotation images.
Future<Uint8List> createMapPinImage(int color) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  final path = ui.Path()
    ..moveTo(32, 77)
    ..cubicTo(26, 65, 6, 45, 6, 30)
    ..cubicTo(6, 15, 17, 3, 32, 3)
    ..cubicTo(47, 3, 58, 15, 58, 30)
    ..cubicTo(58, 45, 38, 65, 32, 77)
    ..close();
  canvas.drawPath(path, ui.Paint()..color = ui.Color(color));
  canvas.drawPath(
    path,
    ui.Paint()
      ..color = const ui.Color(0xFFFFFFFF)
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = 3,
  );
  canvas.drawCircle(
    const ui.Offset(32, 30),
    10,
    ui.Paint()..color = const ui.Color(0xFFFFFFFF),
  );
  final picture = recorder.endRecording();
  try {
    final image = await picture.toImage(64, 80);
    try {
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      if (data == null) throw StateError('Could not encode map pin image.');
      return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    } finally {
      image.dispose();
    }
  } finally {
    picture.dispose();
  }
}

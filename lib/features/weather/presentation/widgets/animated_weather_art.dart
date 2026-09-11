import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedWeatherArt extends StatefulWidget {
  final String condition;
  final double size;
  final DateTime? cityTime;
  final bool? isDay;

  const AnimatedWeatherArt({
    super.key,
    required this.condition,
    this.size = 100,
    this.cityTime,
    this.isDay,
  });

  @override
  State<AnimatedWeatherArt> createState() => _AnimatedWeatherArtState();
}

class _AnimatedWeatherArtState extends State<AnimatedWeatherArt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cond = widget.condition.toLowerCase();
    final isDayTime = widget.isDay ??
        (widget.cityTime != null
            ? (widget.cityTime!.hour >= 6 && widget.cityTime!.hour < 19)
            : (DateTime.now().hour >= 6 && DateTime.now().hour < 19));

    if (cond.contains('rain') || cond.contains('drizzle') || cond.contains('thunderstorm')) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _RainPainter(_controller.value),
            );
          },
        ),
      );
    } else if (cond.contains('snow')) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _SnowPainter(_controller.value),
            );
          },
        ),
      );
    } else if (cond.contains('cloud') || cond.contains('overcast')) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _CloudPainter(_controller.value),
            );
          },
        ),
      );
    } else {
      // Clear sky / Sun / Moon
      if (isDayTime) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _SunPainter(_controller.value),
              );
            },
          ),
        );
      } else {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _MoonPainter(_controller.value),
              );
            },
          ),
        );
      }
    }
  }
}

// ─────────────────────────────────────────────
// Sun Painter with Rotating Glowing Rays
// ─────────────────────────────────────────────
class _SunPainter extends CustomPainter {
  final double progress;
  _SunPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.26;

    // Outer Glow
    final glowPaint = Paint()
      ..color = const Color(0xFFFFD700).withOpacity(0.35 + 0.15 * math.sin(progress * 2 * math.pi))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);
    canvas.drawCircle(center, radius * 1.5, glowPaint);

    // Rotating Rays
    final rayPaint = Paint()
      ..color = const Color(0xFFFFB74D).withOpacity(0.7)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    const rayCount = 8;
    const angleStep = (2 * math.pi) / rayCount;
    final rotation = progress * 2 * math.pi;

    for (int i = 0; i < rayCount; i++) {
      final angle = i * angleStep + rotation;
      final start = Offset(
        center.dx + (radius * 1.25) * math.cos(angle),
        center.dy + (radius * 1.25) * math.sin(angle),
      );
      final end = Offset(
        center.dx + (radius * 1.65) * math.cos(angle),
        center.dy + (radius * 1.65) * math.sin(angle),
      );
      canvas.drawLine(start, end, rayPaint);
    }

    // Core Sun Circle Gradient
    final sunGradient = const RadialGradient(
      colors: [Color(0xFFFFF176), Color(0xFFFFB300)],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    final sunPaint = Paint()..shader = sunGradient;
    canvas.drawCircle(center, radius, sunPaint);
  }

  @override
  bool shouldRepaint(covariant _SunPainter oldDelegate) => oldDelegate.progress != progress;
}

// ─────────────────────────────────────────────
// Cloud Painter with Floating Drifting Puffs
// ─────────────────────────────────────────────
class _CloudPainter extends CustomPainter {
  final double progress;
  _CloudPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final floatOffset = math.sin(progress * 2 * math.pi) * 4;

    final cloudPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = const Color(0xFF90CAF9).withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final path = Path();
    final w = size.width;
    final h = size.height;
    final cy = h * 0.55 + floatOffset;

    path.addOval(Rect.fromLTWH(w * 0.15, cy - h * 0.1, w * 0.4, h * 0.35));
    path.addOval(Rect.fromLTWH(w * 0.35, cy - h * 0.25, w * 0.45, h * 0.45));
    path.addOval(Rect.fromLTWH(w * 0.55, cy - h * 0.1, w * 0.35, h * 0.3));

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, cloudPaint);
  }

  @override
  bool shouldRepaint(covariant _CloudPainter oldDelegate) => oldDelegate.progress != progress;
}

// ─────────────────────────────────────────────
// Rain Painter with Animated Falling Raindrops
// ─────────────────────────────────────────────
class _RainPainter extends CustomPainter {
  final double progress;
  _RainPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw cloud base first
    final cloudPainter = _CloudPainter(progress);
    cloudPainter.paint(canvas, size);

    final rainPaint = Paint()
      ..color = const Color(0xFF81D4FA).withOpacity(0.85)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    const drops = 6;
    for (int i = 0; i < drops; i++) {
      final xFraction = 0.25 + (i * 0.12);
      final speedMultiplier = 1.0 + (i % 3) * 0.3;
      final yProgress = (progress * speedMultiplier + (i * 0.18)) % 1.0;
      
      final startY = size.height * 0.55 + (yProgress * size.height * 0.38);
      final startX = size.width * xFraction;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX - 3, startY + 10),
        rainPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RainPainter oldDelegate) => oldDelegate.progress != progress;
}

// ─────────────────────────────────────────────
// Snow Painter with Drifting Snowflakes
// ─────────────────────────────────────────────
class _SnowPainter extends CustomPainter {
  final double progress;
  _SnowPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final cloudPainter = _CloudPainter(progress);
    cloudPainter.paint(canvas, size);

    final snowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    const flakes = 6;
    for (int i = 0; i < flakes; i++) {
      final xFraction = 0.22 + (i * 0.13);
      final yProgress = (progress + (i * 0.16)) % 1.0;

      final startY = size.height * 0.55 + (yProgress * size.height * 0.38);
      final driftX = size.width * xFraction + math.sin(yProgress * 2 * math.pi + i) * 6;

      canvas.drawCircle(Offset(driftX, startY), 3.0, snowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SnowPainter oldDelegate) => oldDelegate.progress != progress;
}

// ─────────────────────────────────────────────
// Moon Painter for Night Theme
// ─────────────────────────────────────────────
class _MoonPainter extends CustomPainter {
  final double progress;
  _MoonPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.26;

    // Dark background (night sky hue)
    final bgPaint = Paint()..color = const Color(0xFF0B0E14);
    canvas.drawCircle(center, radius * 1.5, bgPaint);

    // Moon base – soft white circle
    final moonPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, moonPaint);

    // Crescent effect – overlapping dark shape offset
    // Static offset – creates a visible crescent
    final offset = Offset(radius * 0.5, 0);
    final crescentPaint = Paint()..color = const Color(0xFF0B0E14);
    canvas.drawCircle(center + offset, radius * 0.9, crescentPaint);
  }

  @override
  bool shouldRepaint(covariant _MoonPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

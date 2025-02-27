import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinnerScreen extends StatefulWidget {
  @override
  _SpinnerScreenState createState() => _SpinnerScreenState();
}

class _SpinnerScreenState extends State<SpinnerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _selectedOffer = 0;

  // List of 12 colors for the segments
  final List<Color> segmentColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.amber,
  ];

  // List of 12 offers
  final List<String> offers = [
    "10% Off",
    "Free Shipping",
    "Buy 1 Get 1",
    "20% Off",
    "Gift Card",
    "50% Off",
    "Free Trial",
    "30% Off",
    "Exclusive Deal",
    "15% Off",
    "Premium Access",
    "Double Points",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spinWheel() {
    _selectedOffer = math.Random().nextInt(12); // Random offer (0-11)
    // Target rotation: each segment is 30° (π/6 radians), align selected offer with bottom (0°)
    double targetRotation =
        -(_selectedOffer * (math.pi / 6)); // Negative to align with bottom
    // Random complete cycles between 5 and 20
    int randomCycles = 5 + math.Random().nextInt(16); // 5 to 20 inclusive
    double extraSpins = randomCycles * 2 * math.pi; // Convert cycles to radians
    double finalRotation =
        -(extraSpins) + targetRotation; // Clockwise with target at bottom

    _controller.reset();
    _animation = Tween<double>(begin: 0, end: finalRotation).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    _controller.forward().then((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You won: ${offers[_selectedOffer]}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spinner Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Rotating spinner wheel
                RotationTransition(
                  turns: _animation,
                  child: Container(
                    width: 300,
                    height: 300,
                    child: CustomPaint(
                      painter: SpinnerPainter(segmentColors, offers),
                    ),
                  ),
                ),
                // Fixed arrow at the bottom
                Positioned(
                  bottom: -20,
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _spinWheel,
              child: Text('Spin the Wheel!'),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for the spinner wheel
class SpinnerPainter extends CustomPainter {
  final List<Color> colors;
  final List<String> offers;

  SpinnerPainter(this.colors, this.offers);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    final double segmentAngle = 2 * math.pi / 12; // 30° in radians

    // Draw each segment
    for (int i = 0; i < 12; i++) {
      final paint = Paint()..color = colors[i];
      final startAngle = i * segmentAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        paint,
      );

      // Draw offer text
      final textPainter = TextPainter(
        text: TextSpan(
          text: offers[i],
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Position text in the middle of the segment
      final angle = startAngle + segmentAngle / 2;
      final textOffset = Offset(
        center.dx + (radius * 0.6) * math.cos(angle) - textPainter.width / 2,
        center.dy + (radius * 0.6) * math.sin(angle) - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

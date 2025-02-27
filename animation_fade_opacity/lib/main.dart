import 'package:animation_fade_opacity/screens/spinner.dart';
import 'package:flutter/material.dart';
import 'screens/fade_screen.dart';
import 'screens/size_screen.dart';
import 'screens/position_screen.dart';
import 'screens/rotation_screen.dart';
import 'screens/color_screen.dart';
import 'screens/staggered_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FadeScreen()),
                  );
                },
                child: Text('Fade Animation'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SizeScreen()),
                  );
                },
                child: Text('Size Animation'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PositionScreen()),
                  );
                },
                child: Text('Position Animation'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RotationScreen()),
                  );
                },
                child: Text('Rotation Animation'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorScreen()),
                  );
                },
                child: Text('Color Animation'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StaggeredScreen()),
                  );
                },
                child: Text('Staggered Animation'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpinnerScreen()),
                  );
                },
                child: Text('spinner Animation'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

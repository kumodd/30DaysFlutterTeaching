import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point for the app.
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Hides the debug banner in the top-right.
      home: CounterPage(), // Sets CounterPage as the main screen.
    );
  }
}

/// A stateful widget to handle dynamic state changes (counter value).
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

/// The state of CounterPage that holds the logic and data.
class _CounterPageState extends State<CounterPage> {
  int _counter = 0; // This variable holds the counter value.

  /// Increments the counter.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Decrements the counter.
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  /// Resets the counter to zero.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Counter App'), // Title in the app bar.
        centerTitle: true, // Centers the title.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically.
          children: [
            Text(
              'Current Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10), // Adds spacing between widgets.
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Aligns buttons horizontally.
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter, // Calls increment logic.
                  child: Text('Increment'),
                ),
                SizedBox(width: 10), // Adds spacing between buttons.
                ElevatedButton(
                  onPressed: _decrementCounter, // Calls decrement logic.
                  child: Text('Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetCounter, // Calls reset logic.
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Makes the reset button red.
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point for the app.
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner.
      home: ProfilePage(), // Sets ProfilePage as the main screen.
    );
  }
}

/// A stateless widget to display a personal profile.
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Profile'), // Title in the app bar.
        centerTitle: true, // Centers the title text.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the content.
        child: Column(
          children: [
            CircleAvatar(
              radius: 50, // Sets the size of the avatar.
              backgroundImage: AssetImage("assets/profile.jpeg"),
            ),
            // NetworkImage(
            //     "https://media.licdn.com/dms/image/v2/D4D03AQHKwnVnD-dZGA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1680599426255?e=1741219200&v=beta&t=l7QfxOIf0xWgUv65vXTnPXCsVbsugerYOrV358Qe0ME") // Replace with your image.
            // ),
            SizedBox(height: 16), // Adds vertical spacing.
            Text(
              'Kumod Yadav',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'kumod@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  '+919876543210',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'About Me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'I am a passionate Flutter developer with a love for creating beautiful and functional apps. '
              'I have experience in building cross-platform applications and a keen interest in UI/UX design.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

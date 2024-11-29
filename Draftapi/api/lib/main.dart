import 'package:flutter/material.dart';
import 'screens/settings_page.dart';
import 'screens/homepage.dart';
import 'screens/weatherDetails.dart';
import 'screens/mainNavigator.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF383636),
      ),
      home: const LandingPage(), // Set the LandingPage as the initial screen
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://thumbs.dreamstime.com/b/day-sun-weather-app-screen-mobile-interface-design-forecast-background-time-concept-vector-banner-260952656.jpg', // Replace with your image URL
            fit: BoxFit.cover,
          ),

          // Centered Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the blank page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainNavigator()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Search City to show its weather'),
            ),
          ),
        ],
      ),
    );
  }
}

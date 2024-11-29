import 'package:flutter/material.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFa9e2d3), Color(0xFF5b548a)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Current Conditions Card
            const WeatherCard(
              title: 'Current Conditions',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfoTile(
                        icon: Icons.thermostat,
                        label: 'Feels Like',
                        value: '24°C',
                      ),
                      WeatherInfoTile(
                        icon: Icons.compress,
                        label: 'Pressure',
                        value: '1015 hPa',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherInfoTile(
                        icon: Icons.visibility,
                        label: 'Visibility',
                        value: '10 km',
                      ),
                      WeatherInfoTile(
                        icon: Icons.cloud,
                        label: 'Cloud Cover',
                        value: '75%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Sunrise/Sunset Card
            const WeatherCard(
              title: 'Sun & Moon',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeatherInfoTile(
                    icon: Icons.wb_sunny,
                    label: 'Sunrise',
                    value: '6:30 AM',
                  ),
                  WeatherInfoTile(
                    icon: Icons.nightlight_round,
                    label: 'Sunset',
                    value: '7:45 PM',
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // 24-Hour Forecast
            WeatherCard(
              title: '24-Hour Forecast',
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 24,
                  itemBuilder: (context, index) {
                    return HourlyForecastItem(
                      time: '${index}:00',
                      temperature: '${20 + index % 5}°C',
                      icon: Icons.cloud,
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Air Quality Card
            const WeatherCard(
              title: 'Air Quality',
              child: Column(
                children: [
                  Text(
                    'Good',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'AQI: 45',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String title;
  final Widget child;

  const WeatherCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoTile({super.key, 
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;

  const HourlyForecastItem({super.key, 
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(icon, color: Colors.white),
          Text(
            temperature,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}


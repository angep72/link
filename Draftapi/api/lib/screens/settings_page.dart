import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  String temperatureUnit = '°C';
  String windSpeedUnit = 'km/h';
  String timeFormat = '24h';
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Load the settings from SharedPreferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
      temperatureUnit = prefs.getString('temperatureUnit') ?? '°C';
      windSpeedUnit = prefs.getString('windSpeedUnit') ?? 'km/h';
      timeFormat = prefs.getString('timeFormat') ?? '24h';
      darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  // Save the settings to SharedPreferences
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificationsEnabled', notificationsEnabled);
    prefs.setString('temperatureUnit', temperatureUnit);
    prefs.setString('windSpeedUnit', windSpeedUnit);
    prefs.setString('timeFormat', timeFormat);
    prefs.setBool('darkMode', darkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
          children: [
            SettingsSection(
              title: 'Units',
              children: [
                ListTile(
                  leading: const Icon(Icons.thermostat, color: Colors.white),
                  title: const Text('Temperature Unit',
                      style: TextStyle(color: Colors.white)),
                  trailing: DropdownButton<String>(
                    value: temperatureUnit,
                    dropdownColor: Colors.grey[800],
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          temperatureUnit = newValue;
                        });
                        _saveSettings(); // Save settings after change
                      }
                    },
                    items: ['°C', '°F']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.air, color: Colors.white),
                  title: const Text('Wind Speed Unit',
                      style: TextStyle(color: Colors.white)),
                  trailing: DropdownButton<String>(
                    value: windSpeedUnit,
                    dropdownColor: Colors.grey[800],
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          windSpeedUnit = newValue;
                        });
                        _saveSettings(); // Save settings after change
                      }
                    },
                    items: ['km/h', 'm/s', 'mph']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: 'Notifications',
              children: [
                SwitchListTile(
                  title: const Text('Enable Notifications',
                      style: TextStyle(color: Colors.white)),
                  subtitle: const Text('Get weather alerts and updates',
                      style: TextStyle(color: Colors.white70)),
                  secondary: const Icon(Icons.notifications, color: Colors.white),
                  value: notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                    _saveSettings(); // Save settings after change
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Display',
              children: [
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.white),
                  title: const Text('Time Format',
                      style: TextStyle(color: Colors.white)),
                  trailing: DropdownButton<String>(
                    value: timeFormat,
                    dropdownColor: Colors.grey[800],
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          timeFormat = newValue;
                        });
                        _saveSettings(); // Save settings after change
                      }
                    },
                    items: ['12h', '24h']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
                  secondary: const Icon(Icons.dark_mode, color: Colors.white),
                  value: darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      darkMode = value;
                    });
                    _saveSettings(); // Save settings after change
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'About',
              children: [
                const ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text('App Version',
                      style: TextStyle(color: Colors.white)),
                  trailing:
                      Text('1.0.0', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip, color: Colors.white),
                  title: const Text('Privacy Policy',
                      style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // Navigate to privacy policy
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.description, color: Colors.white),
                  title: const Text('Terms of Service',
                      style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // Navigate to terms of service
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        const Divider(color: Colors.white24),
      ],
    );
  }
}

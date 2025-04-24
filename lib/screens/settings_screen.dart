import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isBiometricEnabled = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'General',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 10),

          // Dark Mode Toggle
          SwitchListTile(
            title: Text('Dark Mode', style: Theme.of(context).textTheme.bodyLarge),
            secondary: Icon(Icons.dark_mode),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              // Show feedback
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isDarkMode ? 'Dark Mode Enabled' : 'Light Mode Enabled')),
              );
            },
          ),

          // Biometric Authentication Toggle
          SwitchListTile(
            title: Text('Biometric Authentication', style: Theme.of(context).textTheme.bodyLarge),
            secondary: Icon(Icons.fingerprint),
            value: isBiometricEnabled,
            onChanged: (value) {
              setState(() {
                isBiometricEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isBiometricEnabled ? 'Biometric Enabled' : 'Biometric Disabled')),
              );
            },
          ),

          // Notifications Toggle
          SwitchListTile(
            title: Text('App Notifications', style: Theme.of(context).textTheme.bodyLarge),
            secondary: Icon(Icons.notifications_active),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(notificationsEnabled ? 'Notifications On' : 'Notifications Off')),
              );
            },
          ),

          Divider(height: 40, thickness: 2),

          Text(
            'Account',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 10),

          // Profile Settings
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile Settings', style: Theme.of(context).textTheme.bodyLarge),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Coming Soon...')),
              );
            },
          ),

          // Change Password
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password', style: Theme.of(context).textTheme.bodyLarge),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Feature under development!')),
              );
            },
          ),

          Divider(height: 40, thickness: 2),

          // About App
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About CyberSecure+', style: Theme.of(context).textTheme.bodyLarge),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'CyberSecure+',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.security),
                children: [
                  Text('This app is built to enhance CyberSecurity Awareness.\nDeveloped for Innovation & Design Thinking Project.'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

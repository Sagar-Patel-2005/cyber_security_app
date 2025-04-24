import 'package:flutter/material.dart';
import 'package:idt_final_pro/screens/cyber_news_screen.dart';
import 'package:idt_final_pro/screens/password_generator_screen.dart';
import 'package:idt_final_pro/screens/twofa_screen.dart';
import 'package:idt_final_pro/screens/biometric_login_screen.dart';
import 'package:idt_final_pro/screens/file_vault_screen.dart';
import 'package:idt_final_pro/screens/cyber_quiz_screen.dart';
import 'package:idt_final_pro/screens/helpline_screen.dart';
import 'package:idt_final_pro/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function toggleDarkMode; // This function will be passed from main.dart

  HomeScreen({required this.toggleDarkMode});

  final List<Map<String, dynamic>> features = [
    {'title': 'Cyber News', 'icon': Icons.newspaper, 'screen': CyberNewsScreen()},
    {'title': 'Password Generator', 'icon': Icons.password, 'screen': PasswordGeneratorScreen()},
    {'title': '2FA Simulation', 'icon': Icons.verified_user, 'screen': TwoFAScreen()},
    {'title': 'Biometric Login', 'icon': Icons.fingerprint, 'screen': BiometricLoginScreen()},
    {'title': 'Secure File Vault', 'icon': Icons.lock, 'screen': FileVaultScreen()},
    {'title': 'Cyber Quiz', 'icon': Icons.quiz, 'screen': CyberQuizScreen()},
    {'title': 'Helpline', 'icon': Icons.call, 'screen': HelplineScreen()},
    {'title': 'Settings', 'icon': Icons.settings, 'screen': SettingsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CyberSecure+ Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.brightness_6,
              color: Theme.of(context).iconTheme.color, // Adjust icon color based on the theme
            ),
            onPressed: () {
              toggleDarkMode();  // Toggle dark mode when the button is pressed
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => features[index]['screen']),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800 // Dark mode background color
                    : Colors.blueGrey.shade100, // Light mode background color
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(features[index]['icon'], size: 50, color: Theme.of(context).iconTheme.color),
                  SizedBox(height: 10),
                  Text(
                    features[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black, // Use bodyLarge or fallback to default color
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

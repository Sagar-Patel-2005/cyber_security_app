import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  @override
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  final List<String> _lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz'.split('');
  final List<String> _uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  final List<String> _numbers = '0123456789'.split('');
  final List<String> _specialCharacters = '!@#\$%^&*()-_=+[{]}|;:,.<>?'.split('');

  String _generatedPassword = '';
  double _passwordLength = 12.0;
  String _passwordStrength = 'Medium';

  // Function to generate password
  String generatePassword() {
    final random = Random();
    List<String> allCharacters = [];
    allCharacters.addAll(_lowercaseLetters);
    allCharacters.addAll(_uppercaseLetters);
    allCharacters.addAll(_numbers);
    allCharacters.addAll(_specialCharacters);

    String password = '';
    for (int i = 0; i < _passwordLength; i++) {
      password += allCharacters[random.nextInt(allCharacters.length)];
    }

    setPasswordStrength(password);
    return password;
  }

  // Function to check password strength
  void setPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) strength++;

    setState(() {
      if (strength <= 1) {
        _passwordStrength = 'Weak';
      } else if (strength == 2) {
        _passwordStrength = 'Medium';
      } else {
        _passwordStrength = 'Strong';
      }
    });
  }

  // Function to copy password to clipboard
  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password copied to clipboard!')));
  }

  @override
  void initState() {
    super.initState();
    _generatedPassword = generatePassword(); // Generate initial password
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Generated Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Column(
                children: [
                  Text(
                    _generatedPassword,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Strength: $_passwordStrength',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: copyToClipboard,
                    child: Text('Copy to Clipboard'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Password Length: ${_passwordLength.toInt()}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _passwordLength,
              min: 8.0,
              max: 20.0,
              divisions: 12,
              label: _passwordLength.toInt().toString(),
              onChanged: (double value) {
                setState(() {
                  _passwordLength = value;
                  _generatedPassword = generatePassword();
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _generatedPassword = generatePassword();
                });
              },
              child: Text('Generate New Password'),
            ),
          ],
        ),
      ),
    );
  }
}

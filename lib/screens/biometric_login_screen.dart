import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLoginScreen extends StatefulWidget {
  @override
  _BiometricLoginScreenState createState() => _BiometricLoginScreenState();
}

class _BiometricLoginScreenState extends State<BiometricLoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String message = "Not Authenticated";

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to access',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        setState(() {
          message = "Authenticated Successfully!";
        });
      } else {
        setState(() {
          message = "Authentication Failed";
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        message = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biometric Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, size: 100),
            SizedBox(height: 20),
            Text(message),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}

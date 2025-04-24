import 'dart:math';
import 'package:flutter/material.dart';

class TwoFAScreen extends StatefulWidget {
  @override
  _TwoFAScreenState createState() => _TwoFAScreenState();
}

class _TwoFAScreenState extends State<TwoFAScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String generatedOTP = '';
  bool otpSent = false;

  void sendOTP() {
    final random = Random();
    generatedOTP = (100000 + random.nextInt(900000)).toString(); // Random 6 digit OTP
    otpSent = true;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Sent Successfully! (for demo: $generatedOTP)')),
    );

    setState(() {});
  }

  void verifyOTP() {
    if (otpController.text == generatedOTP) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ OTP Verified Successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Incorrect OTP! Try Again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two-Factor Authentication'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your Gmail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendOTP,
              child: Text('Send OTP'),
            ),
            if (otpSent) ...[
              SizedBox(height: 30),
              TextField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                child: Text('Verify OTP'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

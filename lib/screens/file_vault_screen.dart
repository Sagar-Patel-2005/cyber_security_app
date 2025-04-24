import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class FileVaultScreen extends StatefulWidget {
  @override
  _FileVaultScreenState createState() => _FileVaultScreenState();
}

class _FileVaultScreenState extends State<FileVaultScreen> {
  String? _selectedFile;
  String _encryptedFile = '';
  String _password = '';
  bool _isFileEncrypted = false;

  // Function to pick file
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = result.files.single.path;
      });
    }
  }

  // Encrypt file with password
  void encryptFile() {
    if (_selectedFile == null || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select a file and set a password.")));
      return;
    }

    final key = encrypt.Key.fromUtf8(_password.padRight(32, '0').substring(0, 32));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Simulate encryption of the file
    File file = File(_selectedFile!);
    List<int> bytes = file.readAsBytesSync();
    final encrypted = encrypter.encryptBytes(bytes, iv: iv);

    setState(() {
      _encryptedFile = encrypted.base64;
      _isFileEncrypted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File encrypted successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Vault'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a file to encrypt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickFile,
              child: Text('Pick File'),
            ),
            SizedBox(height: 20),
            if (_selectedFile != null)
              Text('Selected File: $_selectedFile', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) => _password = value,
              decoration: InputDecoration(
                labelText: 'Set Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: encryptFile,
              child: Text('Encrypt File'),
            ),
            SizedBox(height: 20),
            if (_isFileEncrypted)
              Text(
                'Encrypted File: $_encryptedFile',
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}

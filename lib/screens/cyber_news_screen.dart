import 'package:flutter/material.dart';

class CyberNewsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> newsList = [
    {
      'title': '🚨 Major Ransomware Attack on Global Bank!',
      'subtitle': 'Hackers demand 10M in cryptocurrency. Investigation ongoing.',
      'date': 'April 20, 2025',
    },
    {
      'title': '🛡️ Google Chrome Issues Urgent Security Update',
      'subtitle': 'Critical vulnerability patched. Update your browsers now.',
      'date': 'April 18, 2025',
    },
    {
      'title': '🔒 WhatsApp Rolls Out End-to-End Encrypted Backups',
      'subtitle': 'New update enhances user data protection even further.',
      'date': 'April 17, 2025',
    },
    {
      'title': '📢 FBI Warns Against Rising Phishing Attacks',
      'subtitle': 'Learn how to protect your emails and passwords.',
      'date': 'April 15, 2025',
    },
    {
      'title': '🧠 AI Helping Detect Cyber Threats Faster',
      'subtitle': 'Machine learning models are the future of cyber defense.',
      'date': 'April 13, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Cyber Security News'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: newsList.length,
        separatorBuilder: (context, index) => Divider(height: 30, thickness: 1),
        itemBuilder: (context, index) {
          var news = newsList[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.security, size: 36, color: Colors.blueGrey),
              title: Text(
                news['title'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    news['subtitle'],
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    news['date'],
                    style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                  ),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Opening full news...')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

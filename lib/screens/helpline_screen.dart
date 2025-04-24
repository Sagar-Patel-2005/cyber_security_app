import 'package:flutter/material.dart';

class HelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            title: Text('Cybersecurity Helpline'),
            subtitle: Text('Call: 123-456-7890'),
            leading: Icon(Icons.phone),
            onTap: () {
              // Add logic to call or open contact here
            },
          ),
          ListTile(
            title: Text('Police Helpline'),
            subtitle: Text('Call: 100'),
            leading: Icon(Icons.phone),
            onTap: () {
              // Add logic to call or open contact here
            },
          ),
          ListTile(
            title: Text('Emergency Helpline'),
            subtitle: Text('Call: 112'),
            leading: Icon(Icons.phone),
            onTap: () {
              // Add logic to call or open contact here
            },
          ),
        ],
      ),
    );
  }
}

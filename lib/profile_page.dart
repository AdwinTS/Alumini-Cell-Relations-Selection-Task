import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String year;
  final String branch;
  final String company;
  final String role;
  final String linkedin;

  const ProfilePage({
    super.key,
    required this.name,
    required this.year,
    required this.branch,
    required this.company,
    required this.role,
    required this.linkedin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Batch Year: $year', style: const TextStyle(fontSize: 18)),
            Text('Branch: $branch', style: const TextStyle(fontSize: 18)),
            Text('Company: $company', style: const TextStyle(fontSize: 18)),
            Text('Role: $role', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.link),
              label: const Text('View LinkedIn'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
              ),
              onPressed: () async {
                if (await canLaunch(linkedin)) {
                  await launch(linkedin);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open LinkedIn')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'profile_page.dart';

class AlumniCard extends StatelessWidget {
  final String name;
  final String year;
  final String branch;
  final String company;
  final String role;
  final String linkedin;

  const AlumniCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              name: name,
              year: year,
              branch: branch,
              company: company,
              role: role,
              linkedin: linkedin,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('$year - $branch'),
              Text('$company – $role'),
            ],
          ),
        ),
      ),
    );
  }
}

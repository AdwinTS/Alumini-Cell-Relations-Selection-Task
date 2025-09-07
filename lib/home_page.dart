// home_page.dart
import 'package:flutter/material.dart';
import 'alumni_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> alumniData = [
    { "name": "Arjun Menon", "year": "2018", "branch": "CSE", "company": "Google", "role": "Software Engineer" ,"linkedin": "https://linkedin.com/in/arjunmenon" },
    { "name": "Neha Sharma", "year": "2019", "branch": "ECE", "company": "Amazon", "role": "SDE" ,"linkedin": "https://linkedin.com/in/nehasharma"},
    { "name": "Rahul Nair", "year": "2020", "branch": "ME", "company": "Tesla", "role": "Mechanical Engineer","linkedin": "https://linkedin.com/in/rahulN" },
    { "name": "Anjali Verma", "year": "2017", "branch": "IT", "company": "Microsoft", "role": "Data Scientist","linkedin": "https://linkedin.com/in/AnjaliV" },
    { "name": "Vikram Singh", "year": "2016", "branch": "CSE", "company": "Infosys", "role": "Consultant","linkedin": "https://linkedin.com/in/VikramSingh" },
    { "name": "Meera Pillai", "year": "2021", "branch": "Civil", "company": "L&T", "role": "Site Engineer","linkedin": "https://linkedin.com/in/MeeraPillai" },
    { "name": "Rohan Das", "year": "2020", "branch": "CSE", "company": "Byju's", "role": "Product Manager","linkedin": "https://linkedin.com/in/RohanDas" },
    { "name": "Divya Iyer", "year": "2018", "branch": "EEE", "company": "Siemens", "role": "Electrical Engineer","linkedin": "https://linkedin.com/in/DivyaIyer" },
    { "name": "Aditya Kumar", "year": "2019", "branch": "CSE", "company": "Meta", "role": "Frontend Developer" ,"linkedin": "https://linkedin.com/in/AdityaKumar"},
    { "name": "Sneha Thomas", "year": "2020", "branch": "ECE", "company": "TCS", "role": "Software Engineer","linkedin": "https://linkedin.com/in/SnehaThomas" },
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final filteredAlumni = alumniData.where((alum) {
      return alum["name"]!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),  // Your logo
        ),
        title: const Text('  Alumni Directory'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredAlumni.length,
                itemBuilder: (context, index) {
                  final alum = filteredAlumni[index];
                  return AlumniCard(
                    name: alum["name"]!,
                    year: alum["year"]!,
                    branch: alum["branch"]!,
                    company: alum["company"]!,
                    role: alum["role"]!,
                    linkedin: alum["linkedin"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

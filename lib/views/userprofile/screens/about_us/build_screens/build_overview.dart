import 'package:flutter/material.dart';

class AboutOverviewScreen extends StatelessWidget {
  const AboutOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About - Overview")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("VPESTATE",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              "VPESTATE is a comprehensive platform for buying, selling, and renting properties such as homes, villas, apartments, and land. "
              "Users can easily discover nearby properties, making it convenient to find a place that meets their needs. "
              "With VPESTATE, users can connect directly through in-app chat to facilitate communication and simplify negotiations. "
              "Property listings are streamlined, allowing users to list their properties with ease.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text("Release Date: November 5, 2024",
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text("Last Update:  November 5, 2024",
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

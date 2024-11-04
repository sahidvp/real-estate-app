import 'package:flutter/material.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

class AboutUserGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("About - User Guide"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const[
            Text("Getting Started",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("1. Sign Up & Log In"),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Sign up with your email, phone number, or Google account."),
                  Text(
                      "• Set up your profile with a profile picture to personalize your account."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("2. Browse Properties",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Explore a wide range of properties including homes, apartments, and land."),
                  Text(
                      "• View detailed property information along with images."),
                  Text(
                      "• Use the image preview feature to get a closer look at the property."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("3. Search & Filter Properties",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Search for properties by location or specific keywords."),
                  Text(
                      "• Use filters to narrow down results based on your preferences, such as price range, property type, and more."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("4. Connect with Sellers",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Use the in-app chat feature to directly contact property sellers."),
                  Text(
                      "• Communicate easily and negotiate terms with sellers without leaving the app."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("5. Send Token Payments",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Secure your interest in a property by sending a token amount through the app."),
                  Text(
                      "• Easily initiate payments for properties and keep track of your token amounts."),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("6. View Payment History & Receipts",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "• Access your payment history to review all transactions."),
                  Text(
                      "• View and download receipts for sent and received payments."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

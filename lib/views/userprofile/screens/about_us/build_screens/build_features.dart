import 'package:flutter/material.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

class AboutFeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("About - Features"),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text("Core Features",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            leading: Icon(Icons.add_business),
            title: Text("Easy Property Listing"),
            subtitle: Text(
                "Quickly list properties for sale, rent, or purchase with simple procedures."),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Discover Nearby Properties"),
            subtitle: Text(
                "Find properties nearby, including homes, villas, apartments, and land."),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("In-App Chat"),
            subtitle: Text(
                "Connect with other users directly through the app for easy communication."),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Send Token Amounts"),
            subtitle: Text(
                "Secure your interest in a property by sending token payments through the app."),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Payment History"),
            subtitle: Text("Track all sent and received payments easily."),
          ),
          ListTile(
            leading: Icon(Icons.home_work),
            title: Text("Buy, Sell, and Rent Properties"),
            subtitle: Text(
                "Explore options to buy, sell, or rent various types of properties."),
          ),
        ],
      ),
    );
  }
}

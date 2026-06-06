import 'package:flutter/material.dart';

// Profile screen with user info and social links
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // profile avatar using AssetImage
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Fruit Lover',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Fresh fruits delivered to your doorstep!',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Link cards
          _linkCard(Icons.language, 'Our Website', context),
          _linkCard(Icons.email, 'Contact Us', context),
          _linkCard(Icons.facebook, 'Facebook Page', context),
        ],
      ),
    );
  }

  // builds a tappable card for external links (placeholder onTap).
  Widget _linkCard(IconData icon, String title, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        // placeholder to show message mimic real action
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('$title tapped')));
        },
      ),
    );
  }
}

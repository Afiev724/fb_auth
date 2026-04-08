import 'package:flutter/material.dart';
import '../auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Email: ${user?.email}"),

          ElevatedButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text("Logout"),
          ),

          ElevatedButton(
            onPressed: () async {
              await _auth.changePassword("newpassword123");
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Password updated")));
            },
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}

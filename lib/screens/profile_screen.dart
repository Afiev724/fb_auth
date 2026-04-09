import 'package:flutter/material.dart';
import '../auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileScreen({super.key});

  Future<void> _showChangePasswordDialog(BuildContext context) async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'New Password'),
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context, true);
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await _auth.changePassword(controller.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated')),
      );
    }
  }

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
            onPressed: () => _showChangePasswordDialog(context),
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}

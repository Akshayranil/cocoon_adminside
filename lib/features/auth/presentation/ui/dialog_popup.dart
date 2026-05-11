import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must click button
    builder: (context) {
      return AlertDialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        title: const Row(
          children: [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 10),
            Text("Logout"),
          ],
        ),

        content: SizedBox(
          width: 400,
          child: const Text(
            "Are you sure you want to logout?",
          ),
        ),

        actions: [

          // ❌ Cancel
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),

          // ✅ Confirm Logout
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.pop(context); // close dialog
            },
            child: const Text("Yes, Logout", style: TextStyle(color: Colors.white),),
          ),
        ],
      );
    },
  );
}
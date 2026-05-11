import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_event.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_state.dart';
import 'package:cocoon_admin/features/auth/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(Icons.logout, size: 60, color: Colors.redAccent),

                const SizedBox(height: 20),

                const Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // ❌ Cancel
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context); // go back
                      },
                      child: const Text("Cancel"),
                    ),

                    // ✅ Yes Logout
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                      },
                      child: const Text("Yes, Logout"),
                    ),
                  ],
                ),

                // 🔥 Bloc Listener for navigation
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoggedOut) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LoginScreen()),
                        (route) => false,
                      );
                    }
                  },
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
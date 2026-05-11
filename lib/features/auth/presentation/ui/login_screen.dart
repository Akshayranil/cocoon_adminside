import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_event.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_state.dart';
import 'package:cocoon_admin/features/navigation/presentation/pages/main_page.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/screen_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const MainPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Card(
            elevation: 5,
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Text(
                    "Admin Login",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(350, 50)
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                    child: const Text("Login",style: TextStyle(color: Colors.white),),
                  ),

                  const SizedBox(height: 15),

                  if (state is AuthLoading)
                    const CircularProgressIndicator(),

                  if (state is AuthError)
                    const Text(
                      "Incorrect email or password",
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 104),
                const Icon(Icons.android, size: 104),
                const SizedBox(height: 54),
                Text(
                  'Hello again',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(fontSize: 54),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSingForm(),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        children: [
                      TextSpan(text: 'Not a member? '),
                      TextSpan(
                          style: TextStyle(color: Colors.blue),
                          text: 'Register now')
                    ])),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingForm() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            controller: _passwordTEController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _singIn,
            child: const Text(
              'Sing In',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Future<void> _singIn() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}

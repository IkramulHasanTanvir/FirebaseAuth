import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sing in as : ${user.email}'),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            }, child: const Text('SingOut'),),
          ],
        ),
      ),
    );
  }
}

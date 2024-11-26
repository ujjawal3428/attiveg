// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SignupPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Sign Up")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 FirebaseAuth.instance.createUserWithEmailAndPassword(
//   email: emailController.text,
//   password: passwordController.text,
// ).then((value) {
//   // Navigate to home page
// }).catchError((error) {
//   // Handle error
// });
//               },
//               child: const Text("Sign Up"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

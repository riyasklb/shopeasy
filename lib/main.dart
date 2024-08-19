import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopeasy/presentation/views/login_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture with Riverpod',
      home: SignInPage(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Sign-In Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SignInPage(),
//     );
//   }
// }

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   User? _user;

//   Future<void> _signInWithGoogle() async {
//     try {
//       // Trigger the Google Sign-In process
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) {
//         // The user canceled the sign-in
//         return;
//       }

//       // Obtain the Google Sign-In authentication details
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // Create a new credential
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in to Firebase with the Google user credentials
//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       setState(() {
//         _user = userCredential.user;
//       });
//     } catch (e) {
//       print('Google Sign-In failed: $e');
//     }
//   }

//   Future<void> _signOut() async {
//     await FirebaseAuth.instance.signOut();
//     await GoogleSignIn().signOut();
//     setState(() {
//       _user = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Sign-In Example'),
//       ),
//       body: Center(
//         child: _user == null
//             ? ElevatedButton(
//                 onPressed: _signInWithGoogle,
//                 child: Text('Sign in with Google'),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Signed in as ${_user!.displayName}'),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _signOut,
//                     child: Text('Sign out'),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

import 'package:bubble_chat/Authentication/signup.dart';
import 'package:bubble_chat/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // login() async {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email.text, password: password.text);
  // }

  login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // email: email,
      // password: password,
      // );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      print('Login failed : $e');
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Login Failed'),
      //       content:
      //           Text('Please check your email and password and try again.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      // },
      // );
    }
  }
  // ignore: avoid_print
  //   print('email: $email, Password: $password');
  //   // ignore: avoid_print
  //   print(email);
  // }

  @override
  Widget build(BuildContext context) {
    //var _login;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bubble Design',
                style: GoogleFonts.redressed(
                  textStyle: const TextStyle(
                    color: CupertinoColors.systemPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Bubble Foundation',
                style: GoogleFonts.redressed(
                  textStyle: const TextStyle(
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Enter Password'),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text('Login'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: unnecessary_string_escapes
                  const Text("Don'\'t have\'n account "),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SignUpScreen())),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:bubble_chat/Authentication/signup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({
//     super.key,
//   });

//   @override
//   State<LoginScreen> createState() => _LoginScreen();
// }

// class _LoginScreen extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _login() {
//     String username = _usernameController.text;
//     String password = _passwordController.text;
//     // ignore: avoid_print
//     print('Username: $username, Password: $password');
//     // ignore: avoid_print
//     print(username);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Bubble Design',
//                 style: GoogleFonts.redressed(
//                   textStyle: const TextStyle(
//                     color: CupertinoColors.systemPurple,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Bubble Foundation',
//                 style: GoogleFonts.redressed(
//                   textStyle: const TextStyle(
//                     color: CupertinoColors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Username',
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(labelText: 'Password'),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('Login'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // ignore: unnecessary_string_escapes
//                   const Text("Don'\'t have\'n account "),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(CupertinoPageRoute(
//                         builder: (context) => const SignUpScreen())),
//                     child: const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Signup',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

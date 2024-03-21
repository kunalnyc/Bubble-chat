import 'dart:io';

import 'package:bubble_chat/Authentication/authservices.dart';
import 'package:bubble_chat/Authentication/login_screen.dart';
import 'package:bubble_chat/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  File? _image;

  final AuthService authService = AuthService();
  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage() async {
    final picker = await _picker.pickImage(source: ImageSource.gallery);
    if (picker != null) {
      setState(() {
        _image = File(picker.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'No image was selected, please select the image to continue'),
        ),
      );
    }
  }

  void signUp() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String displayName = displayNameController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty && displayName.isNotEmpty) {
      final User? newUser =
          await authService.createAccount(email, password, displayName);
      if (newUser != null) {
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) => Home()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account creation failed')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (_image != null)
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: FileImage(_image!),
                    backgroundColor: Colors.black,
                  )
                else
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/519078727/photo/male-silhouette-as-avatar-profile-picture.webp?b=1&s=170667a&w=0&k=20&c=JzPsyMEFcdQp2UlFqLVeuOaj2bOpteXUWFR9FJzTnBM='),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: selectImage,
                  ),
                ),
              ],
            ),
            const Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: displayNameController,
              decoration: const InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




















// import 'dart:ffi';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:bubble_chat/Authentication/authservices.dart';
// import 'package:bubble_chat/Authentication/login_screen.dart';
// import 'package:bubble_chat/Screens/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({
//     super.key,
//   });

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController displayNameController = TextEditingController();
//   File? _image;

//   final AuthService authService = AuthService();
//   final ImagePicker _picker = ImagePicker();

//   Future<void> selectImage() async{

//   final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (picker!= null) {
//     setState((){
//       _image = File(picker.path)
//     });
//   } else{
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text(
//         'No image was selected , please select the image to continue'
//       ),
//       ),
//     );
//   }
//   }
//   //final AuthService authService = AuthService();

//   // Future getImage() async {
//   //   final pickedFile = await picker.getImage(Source: ImageSource.gallery);

//   //   setState(() {
//   //     if (pickedFile != null) {
//   //       _imageFile = File(pickedFile.path);
//   //     } else {
//   //       print('No image selected.');
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final AuthService authService = AuthService();
//     // return GestureDetector(
//     //   onTap: () async {
//     //     if (widget.onPressed != null) {
//     //       widget.onPressed();
//     //     }
//     //     await getImage();
//     // },
//     //  );

//     void signUp() async {
//       final String email = emailController.text.trim();
//       final String password = passwordController.text.trim();
//       final String displayName = displayNameController.text.trim();

//       if (email.isNotEmpty && password.isNotEmpty && displayName.isNotEmpty) {
//         final User? newUser =
//             await authService.createAccount(email, password, displayName);
//         if (newUser != null) {
//           // ignore: use_build_context_synchronously
//           Navigator.of(context).pushReplacement(
//               CupertinoPageRoute(builder: (context) => Home()));
//           // Account creation successful, navigate to the next screen or perform any other action
//           // For example, Navigator.pushReplacementNamed(context, '/home');
//         } else {
//           // Account creation failed, handle error (display error message, etc.)
//           // For example, ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account creation failed')));
//         }
//       } else {
//         // Handle case where fields are empty
//         // For example, ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 if(_image !=null)
//                 CircleAvatar(
//                   radius: 64,
//                   backgroundImage: FileImage(_image!),
//                   backgroundColor: Colors.black,
//                 )else
//                  const CircleAvatar(
//                   radius: 64,
//                   backgroundImage: NetworkImage( 'https://media.istockphoto.com/id/519078727/photo/male-silhouette-as-avatar-profile-picture.webp?b=1&s=170667a&w=0&k=20&c=JzPsyMEFcdQp2UlFqLVeuOaj2bOpteXUWFR9FJzTnBM='),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: IconButton(icon: Icon(Icons.add_a_photo),
//                   onPressed: () => selectImage(context),
//                   ),
//                   ),
                
//               ],
//             ),
//             const Text(
//               'Create an Account',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             // const SizedBox(height: 20),
//             // GestureDetector(
//             //   onTap: getImage,
//             //   child:

//             // )
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: displayNameController,
//               decoration: const InputDecoration(
//                 labelText: 'Display Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: signUp,
//               child: const Text('Sign Up'),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Already have an account?'),
//                 const SizedBox(width: 5),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(CupertinoPageRoute(
//                         builder: (context) => LoginScreen()));
//                     // Navigate to the sign-in screen
//                   },
//                   child: const Text(
//                     'Sign In',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// //   Widget imageprofile() {
// //     return Stack(children: <Widget>[
// //       CircleAvatar(
// //         radius: 80.0,
// //         backgroundImage: NetworkImage(
// //             'https://images.unsplash.com/photo-1544465544-1b71aee9dfa3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
// //       )
// //     ]);
// //   }
// // }




// // ignore: file_names
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:bubble_chat/Screens/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({
//     super.key,
//   });

//   @override
//   State<SignUpScreen> createState() => _LoginScreen();
// }

// class _LoginScreen extends State<SignUpScreen> {
//   Uint8List? _image;
//   File? image;
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();

//   Future<void> selectImage() async {
//     final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picker != null) {
//       final Uint8List im = await picker.readAsBytes();

//       setState(() {
//         _image = im;
//       });
//     } else {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//               'No image was selected, please select the image to continue'),
//         ),
//       );
//     }
//   }

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
//         title: const Text('Register'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   _image != null
//                       ? CircleAvatar(
//                           radius: 64,
//                           backgroundImage: MemoryImage(_image!),
//                           backgroundColor: Colors.black,
//                         )
//                       : const CircleAvatar(
//                           radius: 64,
//                           backgroundColor: Colors.black,
//                           backgroundImage: NetworkImage(
//                               'https://media.istockphoto.com/id/519078727/photo/male-silhouette-as-avatar-profile-picture.webp?b=1&s=170667a&w=0&k=20&c=JzPsyMEFcdQp2UlFqLVeuOaj2bOpteXUWFR9FJzTnBM='),
//                         ),
//                   Positioned(
//                     bottom: -10,
//                     right: 10,
//                     left: 70,
//                     child: CupertinoButton(
//                         onPressed: selectImage,
//                         child: const Icon(
//                           CupertinoIcons.photo_camera_solid,
//                           size: 30,
//                           color: CupertinoColors.systemGrey,
//                         )),
//                   )
//                 ],
//               ),
//               // const CirleAvatar(
//               //   backgroundColor: CupertinoColors.black,
//               //   radius: 70,
//               // ),
//               TextField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username',
//                 ),
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               TextField(
//                 controller: _bioController,
//                 decoration: const InputDecoration(
//                   labelText: 'Bio',
//                 ),
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('SignUp'),
//               ),

//               CupertinoButton(
//                 onPressed: () => Navigator.of(context).pushReplacement(
//                     CupertinoPageRoute(builder: (context) => const Home())),
//                 child: const Text('Guest'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // ignore: unnecessary_string_escapes
//                   const Text("Already have\'n account "),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).pop(),
//                     child: const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Login',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

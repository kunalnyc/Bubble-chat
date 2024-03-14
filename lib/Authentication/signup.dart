// ignore: file_names
import 'dart:io';
import 'dart:typed_data';

import 'package:bubble_chat/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<SignUpScreen> {
  Uint8List? _image;
  File? image;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  Future<void> selectImage() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      final Uint8List im = await picker.readAsBytes();

      setState(() {
        _image = im;
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'No image was selected, please select the image to continue'),
        ),
      );
    }
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // ignore: avoid_print
    print('Username: $username, Password: $password');
    // ignore: avoid_print
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.black,
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              'https://media.istockphoto.com/id/519078727/photo/male-silhouette-as-avatar-profile-picture.webp?b=1&s=170667a&w=0&k=20&c=JzPsyMEFcdQp2UlFqLVeuOaj2bOpteXUWFR9FJzTnBM='),
                        ),
                  Positioned(
                    bottom: -10,
                    right: 10,
                    left: 70,
                    child: CupertinoButton(
                        onPressed: selectImage,
                        child: const Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 30,
                          color: CupertinoColors.systemGrey,
                        )),
                  )
                ],
              ),
              // const CirleAvatar(
              //   backgroundColor: CupertinoColors.black,
              //   radius: 70,
              // ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: const Text('SignUp'),
              ),

              CupertinoButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(builder: (context) => const Home())),
                child: const Text('Guest'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: unnecessary_string_escapes
                  const Text("Already have\'n account "),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

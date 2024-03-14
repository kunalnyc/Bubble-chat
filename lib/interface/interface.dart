import 'package:bubble_chat/Authentication/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bubble Chat',
                style: GoogleFonts.redHatDisplay(
                  textStyle: const TextStyle(
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Beyond Words, Bubbling Ideas Sparking \n           Dialogue, Anytime, Anywhere',
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(
                            color: CupertinoColors.black,
                            //    fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.network(
                  'https://lottie.host/bad68b63-06d9-44a7-88e7-527cc54eac42/aLoSxyPlld.json',
                  width: 200,
                  height: 200,
                  repeat: true,
                  reverse: false,
                  animate: true,
                  filterQuality: FilterQuality.high),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen())),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CupertinoColors.darkBackgroundGray
                                  : CupertinoColors.white,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "Let's Chat",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CupertinoColors.darkBackgroundGray
                                  : CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CupertinoButton(
            //     onPressed: () => Navigator.push(
            //       context,
            //       CupertinoPageRoute(
            //         builder: (context) => const LoginScreen(),
            //       ),
            //     ),
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.circular(12.0),
            //         border: Border.all(
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           'Let\'s Chat',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

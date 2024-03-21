import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 40,
                  ))
            ],
          )
        ],
      )),
    );
  }
}



// import 'package:flutter/material.dart';

// class Messages extends StatelessWidget {
//   const Messages({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: SafeArea(
//           child: Column(
//         children: [
//           Row(
//             children: [
//               const Text(
//                 'Messages',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                     color: Colors.white),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                     size: 40,
//                   ))
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }

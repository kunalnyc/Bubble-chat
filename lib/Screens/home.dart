import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

enum Sky { messages, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.messages: const Color.fromARGB(255, 140, 51, 255),
  Sky.viridian: const Color.fromARGB(255, 140, 51, 255),
  Sky.cerulean: const Color.fromARGB(255, 140, 51, 255),
};

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Sky _selectedSegment = Sky.messages; // Define _selectedSegment here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Bubble',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CupertinoTextField(
              placeholder: 'Search Messages',
              style: GoogleFonts.redHatDisplay(
                textStyle: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 17,
                ),
              ),
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.line_horizontal_3_decrease,
                  color: CupertinoColors.systemPurple,
                ),
              ),
              prefix: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.systemPurple,
                ),
              ),
            ),
          ),
          CupertinoSlidingSegmentedControl<Sky>(
            backgroundColor: const Color.fromARGB(255, 247, 247, 247),
            thumbColor: skyColors[_selectedSegment]!,
            groupValue: _selectedSegment,
            onValueChanged: (Sky? value) {
              if (value != null) {
                setState(() {
                  _selectedSegment = value;
                });
              }
            },
            children: <Sky, Widget>{
              Sky.messages: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    color: _selectedSegment == Sky.messages
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
              ),
              Sky.viridian: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Groups',
                  style: TextStyle(
                    color: _selectedSegment == Sky.viridian
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
              ),
              Sky.cerulean: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Request',
                  style: TextStyle(
                    color: _selectedSegment == Sky.cerulean
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
              ),
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedSegment.index,
              children: [
                MessagesPage(),
                GroupsPage(),
                RequestsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.00),
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add a function to create horizontal stories
            buildStories(),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepPurpleAccent,
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1687186954188-76f7f4a3d829?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8R2lybHN8ZW58MHx8MHx8fDA%3D'),
                  backgroundColor: CupertinoColors.systemPurple,
                ),
                title: Text('John'),
                subtitle: Text('Hey, have you ever been to Los Angeles?'),
                // tileColor: Colors.deepPurpleAccent,
                textColor: Colors.white,
                trailing: Icon(
                  CupertinoIcons.pin_slash_fill,
                  color: Colors.white,
                  size: 20,
                ),
                //    leadingSize: 64,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepPurpleAccent,
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1528916451049-e5d097b61db2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fEdpcmxzfGVufDB8fDB8fHww'),
                  backgroundColor: CupertinoColors.systemPurple,
                ),
                title: Text('Emily'),
                subtitle:
                    Text(' Oh yeah, I went there last summer! It was amazing.'),
                //   tileColor: Colors.deepPurpleAccent,
                trailing: Icon(
                  CupertinoIcons.pin_slash_fill,
                  color: Colors.white,
                  size: 20,
                ),
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1516522973472-f009f23bba59?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fEdpcmxzfGVufDB8fDB8fHww'),
                  backgroundColor: CupertinoColors.systemPurple,
                ),
                title: Text('Jessica'),
                subtitle: Text(
                    'Well, I hit up all the tourist spots, like Hollywood Boulevard and the Walk of Fame. I even spotted a few celebrities!'),
              ),
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //   ),
            //   child: const ListTile(
            //     leading: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           'https://plus.unsplash.com/premium_photo-1687186954188-76f7f4a3d829?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8R2lybHN8ZW58MHx8MHx8fDA%3D'),
            //       backgroundColor: CupertinoColors.systemPurple,
            //     ),
            //     title: Text('Amanda 😍'),
            //     subtitle: Text('Hey, have you ever been to Los Angeles?'),
            //   ),
            // ),
            // Container(
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //   ),
            //   child: const ListTile(
            //     leading: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           'https://plus.unsplash.com/premium_photo-1687186954188-76f7f4a3d829?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8R2lybHN8ZW58MHx8MHx8fDA%3D'),
            //       backgroundColor: CupertinoColors.systemPurple,
            //     ),
            //     title: Text('John'),
            //     subtitle: Text('Hey, have you ever been to Los Angeles?'),
            //   ),
            // ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1687186954188-76f7f4a3d829?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8R2lybHN8ZW58MHx8MHx8fDA%3D'),
                backgroundColor: CupertinoColors.systemPurple,
              ),
              title: Text('Duke'),
              subtitle: Text('No way! Who did you see?'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1675130119382-6f891206f406?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D'),
                backgroundColor: CupertinoColors.systemPurple,
              ),
              title: Text('Amanda'),
              subtitle: Text('Hey, have you ever been to Los Angeles?'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1687186954188-76f7f4a3d829?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8R2lybHN8ZW58MHx8MHx8fDA%3D'),
                backgroundColor: CupertinoColors.systemPurple,
              ),
              title: Text('Alex'),
              subtitle: Text(
                  'Definitely. Nothing beats that California weather. I can\'t wait to go back someday.'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build horizontal stories
  Widget buildStories() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildStoryItem(
            name: 'Name',
            imageUrl:
                'https://images.unsplash.com/photo-1580655653885-65763b2597d0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8TG9zJTIwQW5nZWxlc3xlbnwwfHwwfHx8MA%3D%3D',
          ),
          buildStoryItem(
            name: 'Name',
            imageUrl:
                'https://images.unsplash.com/photo-1542737579-ba0a385f3b84?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8TG9zJTIwQW5nZWxlc3xlbnwwfHwwfHx8MA%3D%3D',
          ),
          buildStoryItem(
            name: 'Name',
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1708274149565-2831e10a65a8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
          ),
          buildStoryItem(
            name: 'Name',
            imageUrl:
                'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
          ),
          buildStoryItem(
            name: 'Name',
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1663013729768-8fcfe4cda447?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
          ),
          // Add more story items here if needed
        ],
      ),
    );
  }

// Function to build individual story item
  Widget buildStoryItem({required String imageUrl, required String name}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.deepPurple, width: 3),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Groups Page'),
    );
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requests Page'),
    );
  }
}

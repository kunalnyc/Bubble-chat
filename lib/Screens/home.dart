import 'package:bubble_chat/functions/signout_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Sky { messages, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.messages: const Color.fromARGB(255, 140, 51, 255),
  Sky.viridian: const Color.fromARGB(255, 140, 51, 255),
  Sky.cerulean: const Color.fromARGB(255, 140, 51, 255),
};

class Home extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Sky _selectedSegment = Sky.messages;

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
        actions: [
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                // backgroundImage: NetworkImage(
                //   'https://media.istockphoto.com/id/519078727/photo/male-silhouette-as-avatar-profile-picture.webp?b=1&s=170667a&w=0&k=20&c=JzPsyMEFcdQp2UlFqLVeuOaj2bOpteXUWFR9FJzTnBM=',
                // ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  }, // Handle settings action
                ),
              ),
            ],
          ),
        ],
      ),
      endDrawer: _buildSettingsDrawer(context),
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
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.00),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add a function to create horizontal stories
            buildStories(),
            // Add your message list here
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
          // Add your story items here
        ],
      ),
    );
  }
}

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Groups Page'),
    );
  }
}

class RequestsPage extends StatelessWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requests Page'),
    );
  }
}

Widget _buildSettingsDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: CupertinoColors.white,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 140, 51, 255),
          ),
          child: Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Edit Profile',
                style: TextStyle(color: CupertinoColors.white),
              ),
              onTap: () {
                // Handle profile
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Help & Support',
                style: TextStyle(color: CupertinoColors.white),
              ),
              onTap: () {
                // Handle profile
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'About',
                style: TextStyle(color: CupertinoColors.white),
              ),
              onTap: () {
                // Handle profile
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
              onTap: () {
                // Handle profile
                AuthSignOut().signOut(context);
              },
            ),
          ),
        ),
      ],
    ),
  );
}

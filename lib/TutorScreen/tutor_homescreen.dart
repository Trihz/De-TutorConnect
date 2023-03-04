import 'package:flutter/material.dart';

class TutorHomescreen extends StatefulWidget {
  const TutorHomescreen({super.key});

  @override
  State<TutorHomescreen> createState() => _TutorHomescreenState();
}

class _TutorHomescreenState extends State<TutorHomescreen> {
  Color tutorScreenColor = const Color.fromARGB(255, 13, 101, 16);

  // function to display the container for displaying the main content
  Widget mainContent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

  // function to display the floating button for forum
  Widget forumFloatingButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: CircleAvatar(
        backgroundColor: tutorScreenColor,
        child: const Text("FORUM",style: TextStyle(fontSize: 10),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(color: tutorScreenColor),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mainContent(),
                  forumFloatingButton()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

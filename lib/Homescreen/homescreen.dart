import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:homeworkplatform/StudentHomescreen/student_homescreen.dart';
import 'package:homeworkplatform/TutorScreen/tutor_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // variable to define the homescreen main color
  Color homeScreenColor = const Color.fromARGB(255, 13, 101, 16);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: homeScreenColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                  child: TextLiquidFill(
                    loadUntil: 0.6,
                    text: 'DeTasks',
                    waveColor: Colors.black,
                    boxBackgroundColor: homeScreenColor,
                    loadDuration: const Duration(milliseconds: 4000),
                    textStyle: const TextStyle(
                        fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorHomescreen()));
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: homeScreenColor),
                        child: const Text(
                          "TUTOR",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        )),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentHomescreen()));
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: homeScreenColor),
                        child: const Text(
                          "STUDENT",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

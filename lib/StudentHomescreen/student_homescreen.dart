import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:homeworkplatform/Forum/forum.dart';
import 'package:homeworkplatform/GradientIcon/gradient_icon.dart';
import 'package:homeworkplatform/MyServices/myservices_ui.dart';
import 'package:homeworkplatform/Services/services_ui.dart';
import 'package:homeworkplatform/StudentHomescreen/students_logic.dart';
import 'package:homeworkplatform/main.dart';

class StudentHomescreen extends StatefulWidget {
  const StudentHomescreen({super.key});

  @override
  State<StudentHomescreen> createState() => _StudentHomescreenState();
}

class _StudentHomescreenState extends State<StudentHomescreen> {
  // variable to define the homescreen main color
  Color studentScreenColor = Color.fromARGB(255, 20, 130, 12);
  Color studentScreenColor2 = Colors.orange;

  // list to store the homewrok categories
  List homeworksList = [
    "Engineering",
    "Nursing",
    "Business",
    "Computer Science",
    "Acturial",
    "GEGIS",
    "Nutrition"
  ];

  /// list to store the details about the pending task
  HashMap<int, List> tasksPending = HashMap();

  /// list to store the details about my services
  HashMap<int, List> myServicesList = HashMap();

  /// list to store the details about engineering
  HashMap<int, List> engineeringTutorsList = HashMap();

  /// list to store the details about nursing tutors
  HashMap<int, List> nursingTutorsList = HashMap();

  /// variable to store the mode (tutor mode / student mode)
  bool mode = false;

  // function to display the safe area
  Widget safeArea() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }

  // function to display the profile of the user
  Widget userProfile() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/steve.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: const Center(
                      child: Text(
                    "Musangi",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 15),
                  )),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: FlutterSwitch(
                    width: 70,
                    height: 40,
                    toggleSize: 30,
                    value: mode,
                    borderRadius: 30,
                    padding: 2.0,
                    toggleColor: Colors.white,
                    toggleBorder: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    switchBorder: Border.all(color: Colors.white),
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    onToggle: (val) {
                      setState(() {
                        mode = val;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: const EdgeInsets.only(left: 5),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: mode
                          ? const Text(
                              "Student",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 15),
                            )
                          : const Text(
                              "Tutor",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 15),
                            )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // function to display the welcome text
  Widget welcomeText() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(top: 2, bottom: 2),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            totalRepeatCount: 1000,
            animatedTexts: [
              TyperAnimatedText('De-TutorConnect is trusted by all students',
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                  speed: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn),
            ],
          ),
        ),
      ),
    );
  }

  /// function to display the search bar
  Widget searchBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: const TextField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelText: "Search for task",
          labelStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w100, fontSize: 12),
        ),
      ),
    );
  }

  // function to display the container for displaying the main content
  Widget tutorScreen() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.63,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [homeworkCategories(), pendingTasks(), myServices()],
      ),
    );
  }

  /// function to display the student screen
  Widget studentScreen() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.63,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            mode ? const SizedBox.shrink() : homeworkCategories(),
            engineeringTutors(),
            nursingTutors()
          ],
        ),
      ),
    );
  }

  // function to show the homework categories
  Widget homeworkCategories() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(right: 30),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.builder(
          itemCount: homeworksList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              padding: const EdgeInsets.only(left: 5),
              margin:
                  const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
              ),
              child: Center(
                child: Text(
                  homeworksList[index].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
            );
          })),
    );
  }

  // function to display the student's pending tasks
  Widget pendingTasks() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 20),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: const Text("Pending Tasks",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.white),
            child: ListView.builder(
                itemCount: tasksPending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.35,
                    margin: const EdgeInsets.only(
                        right: 10, top: 10, bottom: 10, left: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: const EdgeInsets.only(left: 10),
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tasksPending[index]![0].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    margin: const EdgeInsets.only(
                                        top: 0.2, right: 0),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            studentScreenColor,
                                            studentScreenColor2
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Ksh ${tasksPending[index]![1].toString()}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )),
                              ],
                            )),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.0932,
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding: const EdgeInsets.only(left: 10),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(tasksPending[index]![2].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  Text(tasksPending[index]![3].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12))
                                ],
                              ),
                            )),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GradientIcon(
                                  Icons.punch_clock,
                                  25,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                Text(
                                  tasksPending[index]![4].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ))),
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  // function to display task creating
  Widget myServices() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My Services",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyServicesUI()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.23,
                    margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Row(
                      children: const [
                        Text("New Service",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 12)),
                        SizedBox(width: 5),
                        Icon(
                          Icons.add,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: ListView.builder(
                itemCount: myServicesList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 1,
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 5, left: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  GradientIcon(
                                    Icons.star,
                                    17,
                                    LinearGradient(
                                      colors: [
                                        studentScreenColor,
                                        studentScreenColor2,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  GradientIcon(
                                    Icons.star,
                                    17,
                                    LinearGradient(
                                      colors: [
                                        studentScreenColor,
                                        studentScreenColor2,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  GradientIcon(
                                    Icons.star,
                                    17,
                                    LinearGradient(
                                      colors: [
                                        studentScreenColor,
                                        studentScreenColor2,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  GradientIcon(
                                    Icons.star,
                                    17,
                                    const LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.black,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  GradientIcon(
                                    Icons.star,
                                    17,
                                    const LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.black,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Center(
                                child: Text(myServicesList[index]![0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black87,
                                        fontSize: 17)),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      const Text("Starting Price:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Colors.black,
                                              fontSize: 13)),
                                      const SizedBox(width: 10),
                                      Text("Ksh ${myServicesList[index]![1]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      const Text("Delivery period:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Colors.black,
                                              fontSize: 13)),
                                      const SizedBox(width: 10),
                                      Text(myServicesList[index]![2],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.book,
                              color: Colors.black87,
                              size: 40,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  // function to display the floating button for forum
  Widget forumFloatingButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(bottom: 2, top: 2),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ForumScreen())));
        },
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [studentScreenColor, studentScreenColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              shape: BoxShape.circle,
            ),
            child: const Center(
                child: Text(
              "FORUM",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }

  /// function to display  engineering tutors
  Widget engineeringTutors() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: const Text("Engineering Tutors",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.white),
            child: ListView.builder(
                itemCount: engineeringTutorsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Services())));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: const EdgeInsets.only(
                          right: 10, top: 10, bottom: 10, left: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            studentScreenColor,
                                            studentScreenColor2
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    engineeringTutorsList[index]![0].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  const LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  const LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.35,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Center(
                                child: Center(
                                  child: Text(
                                      engineeringTutorsList[index]![1]
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black38,
                                          fontSize: 14)),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.35,
                              padding: const EdgeInsets.only(top: 15),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  const Text("Starting Price: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black87,
                                          fontSize: 12)),
                                  const SizedBox(width: 10),
                                  Text(
                                      "Ksh ${engineeringTutorsList[index]![3].toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black87,
                                          fontSize: 14)),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  /// function to display the nursing tutors
  Widget nursingTutors() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: const Text("Nursing Tutors",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.white),
            child: ListView.builder(
                itemCount: nursingTutorsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Services())));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: const EdgeInsets.only(
                          right: 10, top: 10, bottom: 10, left: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            studentScreenColor,
                                            studentScreenColor2
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    nursingTutorsList[index]![0].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  LinearGradient(
                                    colors: [
                                      studentScreenColor,
                                      studentScreenColor2,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  const LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                GradientIcon(
                                  Icons.star,
                                  17,
                                  const LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.black,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.35,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Center(
                                child: Center(
                                  child: Text(
                                      nursingTutorsList[index]![1].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black38,
                                          fontSize: 14)),
                                ),
                              )),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.35,
                              padding: const EdgeInsets.only(top: 15),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Row(
                                children: [
                                  const Text("Starting Price: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          color: Colors.black87,
                                          fontSize: 12)),
                                  const SizedBox(width: 10),
                                  Text(
                                      "Ksh ${nursingTutorsList[index]![3].toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black87,
                                          fontSize: 14)),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  /// initial function of the screen
  @override
  void initState() {
    tasksPending = StudentsLogic().getPendingTasks();
    myServicesList = StudentsLogic().getMyServices();
    engineeringTutorsList = StudentsLogic().getEngineeringTutors();
    nursingTutorsList = StudentsLogic().getNursingTutors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [studentScreenColor, studentScreenColor2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [studentScreenColor, studentScreenColor2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  safeArea(),
                  userProfile(),
                  welcomeText(),
                  searchBar()
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mode ? studentScreen() : tutorScreen(),
                  forumFloatingButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

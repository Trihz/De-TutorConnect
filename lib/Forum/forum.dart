import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:homeworkplatform/Forum/forum_logic.dart';
import 'package:homeworkplatform/GradientIcon/gradient_icon.dart';
import 'package:homeworkplatform/StudentHomescreen/students_logic.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  // variable to define the homescreen main color
  Color mainColor = Color.fromARGB(255, 20, 130, 12);
  Color mainColor1 = Colors.orange;

  /// variable to define the scroll controller
  final ScrollController scrollController = ScrollController();

  /// variable to store the asked questions
  HashMap<int, List> askedQuestions = HashMap();

  // list to store the topics
  List topics = [
    "Engineering",
    "Nursing",
    "Business",
    "Computer Science",
    "Acturial",
    "GEGIS",
    "Nutrition"
  ];

  /// function to scroll the items when the scroll icon is pressed
  void scrollItems() {
    scrollController.animateTo(
      scrollController.offset + 60, // scroll by 1 pixel each time
      duration: const Duration(milliseconds: 50),
      curve: Curves.linear,
    );
  }

  /// function t display the search bar Container
  Widget searchBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [mainColor, mainColor1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.7,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: const TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: "Search for a topic",
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// widget to display the topics
  Widget topicsList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.only(right: 10, left: 5),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ListView.builder(
                itemCount: topics.length,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemBuilder: ((context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: const EdgeInsets.only(left: 5),
                    margin: const EdgeInsets.only(
                        right: 5, left: 5, top: 5, bottom: 5),
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
                        topics[index].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 12),
                      ),
                    ),
                  );
                })),
          ),
          GestureDetector(
            onTap: () {
              scrollItems();
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.arrow_right,
                  size: 35,
                )),
          )
        ],
      ),
    );
  }

  /// function to display ask a question floating container
  Widget asksQuestion() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [mainColor1, mainColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "ASK",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.question_answer,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  /// function t display the main content of the screen
  Widget mainContent() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.68,
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: ListView.builder(
            itemCount: askedQuestions.length,
            itemBuilder: ((context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 1,
                margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Center(
                                child: GradientIcon(
                                  Icons.question_mark_sharp,
                                  30,
                                  LinearGradient(
                                    colors: [
                                      mainColor,
                                      mainColor1,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: Center(
                                child: Text(
                                  askedQuestions[index]![0].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                askedQuestions[index]![1].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "(${askedQuestions[index]![2].toString()})",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 1,
                      margin: const EdgeInsets.only(top: 10),
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.05,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.tag,
                              size: 15,
                              color: mainColor,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 228, 238, 222),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      askedQuestions[index]![4][index],
                                      style: const TextStyle(fontSize: 10),
                                    )),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Previous Answers:",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                askedQuestions[index]![3],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.ads_click,
                                size: 15,
                              )
                            ],
                          ),
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 1,
                        padding: const EdgeInsets.only(right: 10),
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 15,
                              color: mainColor1,
                            ),
                            const SizedBox(width: 5),
                            Text("${askedQuestions[index]![5]}",
                                style: TextStyle(
                                    color: mainColor1,
                                    fontStyle: FontStyle.italic)),
                          ],
                        )),
                  ],
                ),
              );
            })));
  }

  /// the initial function of the screen
  @override
  void initState() {
    askedQuestions = ForumLogic().getAskedQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          searchBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          topicsList(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          mainContent(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          asksQuestion(),
        ],
      ),
    ));
  }
}

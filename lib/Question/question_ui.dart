import 'package:flutter/material.dart';
import 'package:homeworkplatform/GradientIcon/gradient_icon.dart';

class QuestionUI extends StatefulWidget {
  const QuestionUI({super.key});

  @override
  State<QuestionUI> createState() => _QuestionUIState();
}

class _QuestionUIState extends State<QuestionUI> {
  // variable to define the homescreen main color
  Color mainColor = const Color.fromARGB(255, 20, 130, 12);
  Color mainColor1 = Colors.orange;

  /// variable to define the text editing controller
  // text form controller
  final TextEditingController textEditingController = TextEditingController();

  /// function to display the safe area
  Widget safeArea() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.07);
  }

  /// function to display the question's description
  Widget question() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GradientIcon(
                        Icons.person_3,
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
                      const SizedBox(height: 5),
                      const Text("@Trihz",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              fontSize: 14))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [mainColor, mainColor1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Question",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                      Text("Is mosfet a bipolar or unipolar device?",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 18)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Problem Description",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 1,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: const Text(
                    "I am trying to better understand the difference between bipolar junction transistors and metal-oxide-semiconductor field-effect transistors (MOSFETs). I have come across conflicting information regarding whether MOSFETs are considered bipolar devices. Can someone clarify whether MOSFETs are bipolar or not and explain the differences between MOSFETs and BJTs?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 2,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// function to display the answers
  Widget answers() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(color: Colors.transparent),
    );
  }

  /// function to display the post answer section
  Widget postAnswer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("Give your answer")),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: TextFormField(
                controller: textEditingController,
                minLines: 3,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: "Task definition",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [safeArea(), question(), postAnswer(),answers()],
        ),
      ),
    );
  }
}

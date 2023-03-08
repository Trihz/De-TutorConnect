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
  final TextEditingController textEditingController = TextEditingController();

  /// this variable sets the initial value for the dropdown
  String initialValue = "Engineering";

  /// this variable stores the dropdown items
  var dropdownItems = [
    "Engineering",
    "Nursing",
    "Business",
  ];

  /// function to display the safe area
  Widget safeArea() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.07);
  }

  /// function to display ask a question section
  Widget askAQuestion() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          GradientIcon(
            Icons.question_mark,
            70,
            LinearGradient(
              colors: [
                mainColor,
                mainColor1,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Ask a Question",
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
        ],
      ),
    );
  }

  /// function to display the question title section
  Widget questionTitle() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
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
                child: Text("Title of the question",
                    style: TextStyle(color: mainColor))),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                ),
                labelText: "Type a brief and clear title for your question",
                labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// function to display the question's description
  Widget questionBody() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
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
                  "Description the question",
                  style: TextStyle(color: mainColor),
                )),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: TextFormField(
                controller: textEditingController,
                minLines: 3,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: "Give a brief descripition about your problem ",
                    hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              )),
        ],
      ),
    );
  }

  /// function to display the answers
  Widget keyWord() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
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
                  "Choose a Keyword",
                  style: TextStyle(color: mainColor),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.7,
                margin: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: mainColor,
                      ),
                    ),
                    labelText: "Type a keyword",
                    labelStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.05,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: GradientIcon(
                    Icons.search,
                    25,
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
            ],
          ),
        ],
      ),
    );
  }

  /// function to display the post answer section
  Widget category() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose category of the question",
                  style: TextStyle(color: mainColor),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.35,
            margin: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: DropdownButtonFormField(
              value: initialValue,
              dropdownColor: Colors.white,
              iconEnabledColor: mainColor,
              iconDisabledColor: mainColor,
              items: dropdownItems.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              ),
              style: const TextStyle(color: Colors.black),
              onChanged: (String? value) {},
            ),
          ),
        ],
      ),
    );
  }

  /// function to display the post question button
  Widget postQuestion() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [mainColor, mainColor1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const Center(
        child: Text(
          "POST QUESTION",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
        ),
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
          children: [
            safeArea(),
            askAQuestion(),
            questionTitle(),
            questionBody(),
            keyWord(),
            category(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            postQuestion()
          ],
        ),
      ),
    );
  }
}

import 'dart:collection';

class ForumLogic {
  /// variable to store a of all questions asked
  List askedQuestions = [
    [
      "Is mosfet a bipolar or unipolar device?",
      "Digital Electronics",
      "Engineering",
      "3",
      ["Electronics", "Digital", "Circuits"],
      "Stephen"
    ],
    [
      "Explain the concept of Von Misses",
      "Mechanical Design",
      "Engineering",
      "5",
      ["Stress Analysis", "Mechanical", "Machine Drives"],
      "Aida"
    ],
    [
      "How do I configure registers in arduino",
      "Micro-controllers",
      "Engineering",
      "1",
      ["Controllers", "Processors", "Programming"],
      "Vic"
    ],
    [
      "Explain etymology etymologically",
      "Critical Thinking",
      "Business",
      "0",
      ["Critical", "Communication", "Social"],
      "Nic"
    ]
  ];

  /// function to get the asked questions and store them in a hashmap
  HashMap<int, List> getAskedQuestions() {
    HashMap<int, List> askedQuestionsList = HashMap();
    int tasksCount = askedQuestions.length;
    for (int x = 0; x < tasksCount; x++) {
      askedQuestionsList[x] = askedQuestions[x];
    }

    print("Data: ${askedQuestionsList[1]![1][2]}");
    return askedQuestionsList;
  }
}

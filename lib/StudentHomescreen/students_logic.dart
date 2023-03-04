import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentsLogic {
  /// list of pending tasks for tesing purposes
  List pendingTasks = [
    ["#08874", "200", "Engineering", "Designing a PCB circuit", "23/01/2022"],
    ["#03628", "150", "Nursing", "Biomedical report", "23/01/2022"],
    ["#03782", "120", "Business", "Supply chain management", "23/01/2022"],
  ];

  /// list of my services
  List myServices = [
    ["Expert in solving algebraic questions", "200", "2 days", "5"],
    ["Expert in writing business reports", "150", "1 day", "3"],
    ["Expert in writing lab reports", "120", "3 days", "2"],
  ];

  /// list of engineering tutors
  List engineeringTutors = [
    ["Stephen", "Expert in solving algebraic questions", "3", "200"],
    ["Nic", "Expert in writing business reports", "3", "250"],
    ["Winnie", "Expert in writing lab reports", "3", "150"],
  ];

  /// list of nursing tutors
  List nursingTutors = [
    ["Alice", "Expert in writing medical reports", "3", "456"],
    ["Winnie", "Expert in writing lab reports", "3", "134"],
    ["Jane", "Expert in writing lab reports", "3", "210"],
  ];

  /// function to display a toast message
  void displayToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  /// function to get the pending tasks
  HashMap<int, List> getPendingTasks() {
    HashMap<int, List> tasksPending = HashMap();
    int tasksCount = pendingTasks.length;
    for (int x = 0; x < tasksCount; x++) {
      tasksPending[x] = pendingTasks[x];
    }
    print(tasksPending.length.toString());

    return tasksPending;
  }

  /// function to get my services
  HashMap<int, List> getMyServices() {
    HashMap<int, List> mySevicesList = HashMap();
    int tasksCount = myServices.length;
    for (int x = 0; x < tasksCount; x++) {
      mySevicesList[x] = myServices[x];
    }
    print(mySevicesList);

    return mySevicesList;
  }

  /// function to get engineering tutors
  HashMap<int, List> getEngineeringTutors() {
    HashMap<int, List> engineeringTutorsList = HashMap();
    int tasksCount = myServices.length;
    for (int x = 0; x < tasksCount; x++) {
      engineeringTutorsList[x] = engineeringTutors[x];
    }
    print(engineeringTutorsList);

    return engineeringTutorsList;
  }

  /// function to get nursing tutors
  HashMap<int, List> getNursingTutors() {
    HashMap<int, List> nursingTutorsList = HashMap();
    int tasksCount = myServices.length;
    for (int x = 0; x < tasksCount; x++) {
      nursingTutorsList[x] = nursingTutors[x];
    }
    print(nursingTutorsList);

    return nursingTutorsList;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  TextEditingController textFieldController = TextEditingController();
  RxList tasks = [].obs;
  RxList hiddenTasks = [].obs;
  RxList selectedTaskIndices = [].obs; // Track selected state


  TextEditingController createTextFieldController = TextEditingController();
  RxList<String> tasks2 = <String>[].obs;
RxString selectedTask = ''.obs;


 void setSelectedTask(String task) {
    selectedTask.value = task; // Update the value of RxString
  }
  void addTask2(String task) {
    tasks2.add(task);
  }

  void removeTask2(int index) {
    tasks2.removeAt(index);
  }
  void updateUI() {
    // Call update() on the tasks2 RxList to trigger UI updates
    tasks2.refresh();
  }






  void addTask(String task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void toggleSelected(int index) {
    if (!hiddenTasks.contains(index)) {
      hiddenTasks.add(index); // Hide the selected task
    } else {
      hiddenTasks.remove(index); // Unhide the selected task
    }
    update(); // Notify listeners
  }

  void showHiddenTasks() {
    hiddenTasks.clear(); // Clear the list of hidden tasks
    update(); // Notify listeners
  }

  bool isTaskHidden(int index) {
    return hiddenTasks.contains(index);
  }

  void editTask(int index, String text) {}
}


import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/controller/task_controller/task_controller.dart';
import 'package:basic_intigration/utils/routes/routes.dart';
import 'package:basic_intigration/widget/sized_box.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TaskCreateScreen extends StatefulWidget {
  @override
  _TaskCreateScreenState createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  TextEditingController _textFieldController = TextEditingController();
  final TaskController _taskController = Get.find();
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              context: context,
              text: 'Task List',
              fontSize: AppSizes.getPhoneSize(context, 20),
             color: AppColors.grayColor,
            ),
            SizedBoxWidget(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _taskController.tasks2.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(_taskController.tasks2[index]),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm"),
                              content: Text(
                                "Are you sure you want to delete this task?",
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (direction) {
                        _taskController.removeTask2(index);
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: () {
                  // Set the selected task when list item is tapped
                  _taskController.setSelectedTask(_taskController.tasks2[index]);
                  // Navigate to other page
                  context.push(Routes.assignTask);
                        },
                        child: ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.list),
                              SizedBoxWidget(
                                width: 20,
                              ),
                              TextWidget(
                                text: _taskController.tasks2[index],
                                context: context,
                                fontSize: AppSizes.getPhoneSize(context, 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Task'),
          content: TextField(
            controller: _taskController.createTextFieldController,
            decoration: InputDecoration(hintText: "Enter your task"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('CREATE'),
              onPressed: () {
                _taskController
                    .addTask2(_taskController.createTextFieldController.text);
                _taskController.createTextFieldController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

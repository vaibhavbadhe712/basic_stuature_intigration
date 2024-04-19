
import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/controller/task_controller/task_controller.dart';
import 'package:basic_intigration/widget/material_textform_field_widget.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TaskManagementScreen extends StatelessWidget {
  final TaskController _taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bodyColor,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(kToolbarHeight + 10), // Add 10 for shadow height
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset from bottom
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: AppColors.bodyColor, // Adjust color as needed
              title: _appbarWidget(context),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _taskController.tasks.length,
                  itemBuilder: (context, index) {
                    if (_taskController.isTaskHidden(index)) {
                      // Hide the task if it's in the hiddenTasks list
                      return SizedBox();
                    } else {
                      return Dismissible(
                        key: Key(_taskController.tasks[index]),
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
                          _taskController.removeTask(index);
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: _buildTaskItem(context, index),
                      );
                    }
                  },
                ),
              ),
            ),
            _addtaskTextWidget(context),
          ],
        ),
      ),
    );
  }

  _appbarWidget(BuildContext context) {
        TextEditingController createTextFieldController = _taskController.createTextFieldController;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IconButton(
        //   icon: Icon(Icons.arrow_back, size: 35), // Change to your back icon
        //   onPressed: () {
        //     // Add your back button functionality here
        //                     Navigator.pop(context);

        //   },
        // ),
        SizedBox(width:0),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: 
             Obx(()=>
               TextWidget(
                text: "${_taskController.selectedTask.toString()}",
                context: context,
                color: Colors.black,
                fontSize: AppSizes.getPhoneSize(context, 18),
                fontWeight: FontWeight.bold,
                           ),
             ),
          ),
        
        Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert, size: 35),
          onPressed: () {
            _bottomWidget(context);
          },
        ),
      ],
    );
  }

  _bottomWidget(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: Colors.transparent,
      backgroundColor: AppColors.bodyColor,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  context: context,
                  text: "Show completed",
                  color: AppColors.blackColor,
                  fontSize: AppSizes.getPhoneSize(context, 16),
                ),
                TextWidget(
                  context: context,
                  text: "Short",
                  color: AppColors.blackColor,
                  fontSize: AppSizes.getPhoneSize(context, 16),
                ),
                TextWidget(
                  context: context,
                  text: "Rename List",
                  color: AppColors.blackColor,
                  fontSize: AppSizes.getPhoneSize(context, 16),
                ),
                TextWidget(
                  context: context,
                  text: "Delete list",
                  color: AppColors.blackColor,
                  fontSize: AppSizes.getPhoneSize(context, 16),
                )
              ],
            ),
          ),
        );
      },
    );
  }
Widget _buildTaskItem(BuildContext context, int index) {
  return ListTile(
    title: TextWidget(
      context: context,
      text: _taskController.tasks[index],
      fontSize: AppSizes.getPhoneSize(context, 18),
    ),
    leading: Radio(
      value: index,
      groupValue: _taskController.selectedTaskIndices.contains(index) ? index : null,
      onChanged: (value) {
        _taskController.toggleSelected(index);
      },
    ),
    onTap: () {
      _showEditDialog(context, index);
    },
  );
}

void _showEditDialog(BuildContext context, int index) {
  TextEditingController textEditingController = TextEditingController();
  textEditingController.text = _taskController.tasks[index];
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Edit Task"),
        content: TextField(
          controller: textEditingController,
          decoration: InputDecoration(hintText: "Enter task"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _taskController.editTask(index, textEditingController.text);
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}


  Widget _addtaskTextWidget(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppSizes.getPhoneSize(context,15)),
      child: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     _taskController.showHiddenTasks(); // Show hidden tasks
          //   },
          //   child: Text('Show Tasks'),
          // ),
          Row(
            children: [
              Expanded(
                child: MaterialTextFormFieldWidget(
                  context: context,
                  textEditingController: _taskController.textFieldController,
                  hintText: " Add a task",
                  borderColor: AppColors.grayColor,
                  fontSize: AppSizes.getPhoneSize(context, 17),
                   contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 35,
                onPressed: () {
                  _taskController
                      .addTask(_taskController.textFieldController.text);
                  _taskController.textFieldController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

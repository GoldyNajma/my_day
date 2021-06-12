import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_day/common/my_day_colors.dart';
import 'package:my_day/utils/widgets/my_day_rounded_button.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_share_task_field.dart';
import 'package:my_day/utils/widgets/task_dialogs/my_day_task_dialog.dart';

class MyDayShareTaskDialog extends StatefulWidget {
  final int taskId;
  
  const MyDayShareTaskDialog({ 
    Key? key, 
    required this.taskId, 
  }) : super(key: key);

  @override
  _MyDayShareTaskDialogState createState() => _MyDayShareTaskDialogState();
}

class _MyDayShareTaskDialogState extends State<MyDayShareTaskDialog> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onCancelShareTask(BuildContext context) async {
    print('_onCancelShareTask');
    Navigator.pop(context);
    await showDialog(
      context: context,
      builder: (_) => MyDayTaskDialog(taskId: widget.taskId),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Widget cancelShareButton = GestureDetector(
      onTap: () => _onCancelShareTask(context),
      child: const Icon(Boxicons.bx_arrow_back, size: 21),
    );
    bool validatedAtLeastOnce = false;    

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: [ cancelShareButton ]),
              const SizedBox(height: 30),
              Text('My Day lets you share tasks with other users', 
                style: textTheme.bodyText2!.apply(
                  fontFamily: 'Ropa Sans'
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: StatefulBuilder(
                  builder: (BuildContext sbContext, StateSetter sbSetState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MyDayShareTaskField(
                        controller: _emailController,
                        autovalidateMode: validatedAtLeastOnce 
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          MyDayRoundedButton(
                            onPressed: () {
                              bool formIsValid = _formKey.currentState!.validate();
                              
                              if(formIsValid) {
                                print('~~~~~~~~~~~~~~valid~~~~~~~~~~~~~~');
                                Navigator.pop(context);
                              } else {
                                print('~~~~~~~~~~~~not valid~~~~~~~~~~~~');
                              }
                              if (!validatedAtLeastOnce) {
                                sbSetState(() => validatedAtLeastOnce = true);
                              }
                              print('taskId: ${widget.taskId}');
                              print('email: ${_emailController.text}');
                            },
                            buttonColor: MyDayColors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            text: 'Share',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
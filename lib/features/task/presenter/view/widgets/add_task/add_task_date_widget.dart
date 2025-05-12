import 'package:flutter/material.dart';

import '../../../../../../core/shared/widgets/custom_text_form_field.dart';

class AddTaskDateWidget extends StatefulWidget {
  const AddTaskDateWidget({
    super.key,
    required this.taskDateController,
  });
  final TextEditingController taskDateController;

  @override
  State<AddTaskDateWidget> createState() => _AddTaskDateWidgetState();
}

class _AddTaskDateWidgetState extends State<AddTaskDateWidget> {
  bool _showCalender = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          readOnly: true,
          controller: widget.taskDateController,
          suffix: const Icon(Icons.calendar_month_outlined),
          hintText: "Press to set deadline",
          onTap: () async {
            setState(() {
              _showCalender = !_showCalender;
            });
          },
        ),
        if (_showCalender)
          SizedBox(
            height: 300,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateChanged: (value) {
                widget.taskDateController.text = value.toString().split(' ')[0];
              },
            ),
          ),
      ],
    );
  }
}

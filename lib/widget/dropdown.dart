import 'package:casino_web_app/res/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;

  CustomDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[400] ?? Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.textfieldBg,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
              color: Colors.grey[400] ?? Colors.transparent, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: widget.items,
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue; // Update dropdownValue when changed
                });
                widget.onChanged(
                    newValue); // Call parent widget's onChanged callback
              },
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              iconSize: 24,
              elevation: 2,
            ),
          ),
        ),
      ),
    );
  }
}

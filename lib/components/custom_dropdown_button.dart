import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String label;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic) onChanged;
  CustomDropdownButton({this.label, this.value, this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: SizedBox(
            width: 100,
            child: Text(label),
          ),
        ),
        DropdownButton(
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

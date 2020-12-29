import 'package:flutter/material.dart';

class SettingItems {
  static List<DropdownMenuItem<int>> mode = [
    DropdownMenuItem(
      child: Text("オート"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("暖房"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("冷房"),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text("除湿"),
      value: 4,
    ),
  ];

  static List<int> tempList = [
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29
  ];
  static List<DropdownMenuItem<int>> temp = tempList
      .map((_temp) => DropdownMenuItem(
            child: Text("$_temp℃"),
            value: _temp - 15,
          ))
      .toList();

  static List<DropdownMenuItem<int>> fan = [
    DropdownMenuItem(
      child: Text("自動"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("風量:小"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("風量:中"),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text("風量:大"),
      value: 4,
    ),
  ];

  static List<DropdownMenuItem<int>> vdir = [
    DropdownMenuItem(
      child: Text("自動"),
      value: 1,
    ),
  ];

  static List<DropdownMenuItem<int>> hdir = [
    DropdownMenuItem(
      child: Text("自動"),
      value: 1,
    ),
  ];
}

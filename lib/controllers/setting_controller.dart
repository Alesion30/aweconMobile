import 'package:awecon/models/setting.dart';
import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier {
  Setting setting = Setting();
  int tempOffset = 15;

  void reload() {
    notifyListeners();
  }

  void setMode(int mode) {
    this.setting.mode = mode;
    reload();
  }

  void setTemp(int temp) {
    this.setting.temp = temp + tempOffset;
    reload();
  }

  void setFan(int fan) {
    this.setting.fan = fan;
    reload();
  }

  void setVdir(int vdir) {
    this.setting.vdir = vdir;
    reload();
  }

  void setHdir(int hdir) {
    this.setting.hdir = hdir;
    reload();
  }
}

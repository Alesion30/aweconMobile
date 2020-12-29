import 'package:awecon/config.dart';
import 'package:awecon/models/setting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingController extends ChangeNotifier {
  Setting setting = Setting();
  int tempOffset = 15;

  Future stopAircon() async {
    final String endpoint = Config.apiUrl + '/control/off';
    print(endpoint);
    final http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }

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

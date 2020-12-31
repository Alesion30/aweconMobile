import 'package:awecon/config.dart';
import 'package:awecon/models/setting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingController extends ChangeNotifier {
  Setting setting = Setting();
  int tempOffset = 15;
  String apiUrl = Config.apiUrl;
  TextEditingController apiUrlEditingController =
      TextEditingController(text: Config.apiUrl);

  void resetApiUrl() {
    this.apiUrl = Config.apiUrl;
    this.apiUrlEditingController = TextEditingController(text: Config.apiUrl);
    this.reload();
  }

  Future<bool> stopAircon() async {
    final String endpoint = this.apiUrl + '/control/off';
    print(endpoint);
    final http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      print(response.body);
      return false;
    } else {
      print('API error!!');
      return true;
    }
  }

  Future<bool> controlAircon() async {
    String endpoint = this.apiUrl + '/control/on';
    endpoint += '?mode=' + this.setting.mode.toString();
    endpoint += '&temp=' + this.setting.temp.toString();
    endpoint += '&fan=' + (this.setting.fan - 1).toString();
    endpoint += '&vdir=' + (this.setting.vdir - 1).toString();
    endpoint += '&hdir=' + (this.setting.hdir - 1).toString();
    print(endpoint);
    final http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      print(response.body);
      return false;
    } else {
      print(response.body);
      print('API error!!');
      return true;
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

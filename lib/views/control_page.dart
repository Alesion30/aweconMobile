import 'package:awecon/components/custom_alert_dialog.dart';
import 'package:awecon/components/custom_button.dart';
import 'package:awecon/components/custom_dropdown_button.dart';
import 'package:awecon/controllers/setting_controller.dart';
import 'package:awecon/data/setting_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingController>(
      create: (_) => SettingController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Awecon 操作画面'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Consumer<SettingController>(builder: (context, model, child) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'エアコンの設定情報を入力してください！',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '[API_URL: ' + model.apiUrl + ']',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                CustomDropdownButton(
                  label: '運転モード',
                  value: model.setting.mode,
                  items: SettingItems.mode,
                  onChanged: (value) {
                    model.setMode(value);
                  },
                ),
                CustomDropdownButton(
                  label: '温度',
                  value: model.setting.temp - model.tempOffset,
                  items: SettingItems.temp,
                  onChanged: (value) {
                    model.setTemp(value);
                  },
                ),
                CustomDropdownButton(
                  label: '風量',
                  value: model.setting.fan,
                  items: SettingItems.fan,
                  onChanged: (value) {
                    model.setFan(value);
                  },
                ),
                CustomDropdownButton(
                  label: '風向の高さ',
                  value: model.setting.vdir,
                  items: SettingItems.vdir,
                  onChanged: (value) {
                    model.setVdir(value);
                  },
                ),
                CustomDropdownButton(
                  label: '風向の左右',
                  value: model.setting.hdir,
                  items: SettingItems.hdir,
                  onChanged: (value) {
                    model.setHdir(value);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: '停止する',
                        color: Colors.red[700],
                        textColor: Colors.white,
                        onPressed: () async {
                          final status = await model.stopAircon();
                          if (status) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: '通信エラー',
                                  content: 'エアコンの停止に失敗しました',
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: '成功!!',
                                  content: 'エアコンを停止する信号を送信しました',
                                );
                              },
                            );
                          }
                        },
                      ),
                      CustomButton(
                        text: '起動する',
                        color: Colors.blue[400],
                        textColor: Colors.white,
                        onPressed: () async {
                          final status = await model.controlAircon();
                          if (status) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: '通信エラー',
                                  content: 'エアコンの起動に失敗しました',
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: '成功!!',
                                  content: 'エアコンを起動する信号を送信しました',
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
        floatingActionButton: Consumer<SettingController>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text("API URLの設定"),
                      content: TextField(
                        controller: model.apiUrlEditingController,
                        decoration: InputDecoration(labelText: 'API URL'),
                        onChanged: (text) {
                          model.apiUrl = text;
                          model.reload();
                        },
                      ),
                      actions: [
                        FlatButton(
                          child: Text("初期値に戻す"),
                          onPressed: () => {
                            model.resetApiUrl(),
                            Navigator.pop(context),
                          },
                        ),
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.settings),
            );
          },
        ),
      ),
    );
  }
}

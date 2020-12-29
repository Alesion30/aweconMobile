import 'package:awecon/components/CustomButton.dart';
import 'package:awecon/components/custom_dropdown_button.dart';
import 'package:awecon/data/SettingItems.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awecon 操作画面'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'エアコンの設定情報を入力してください！',
              ),
            ),
            CustomDropdownButton(
              label: '運転モード',
              value: 2,
              items: SettingItems.mode,
              onChanged: (value) {},
            ),
            CustomDropdownButton(
              label: '温度',
              value: 2,
              items: SettingItems.temp,
              onChanged: (value) {},
            ),
            CustomDropdownButton(
              label: '風量',
              value: 1,
              items: SettingItems.fan,
              onChanged: (value) {},
            ),
            CustomDropdownButton(
              label: '風向の高さ',
              value: 1,
              items: SettingItems.vdir,
              onChanged: (value) {},
            ),
            CustomDropdownButton(
              label: '風向の左右',
              value: 1,
              items: SettingItems.hdir,
              onChanged: (value) {},
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
                    onPressed: () {},
                  ),
                  CustomButton(
                    text: '起動する',
                    color: Colors.blue[400],
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

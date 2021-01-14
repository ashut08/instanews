import 'package:flutter/material.dart';
import '../data/sharedpref.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 16;
  List<int> colors = [0xFF455A64, 0xFF673AB7, 0xFF795548];

  SPsetting setting;

  @override
  void initState() {
    setting = SPsetting();
    setting.init().then((value) {
      setState(() {
        settingColor = setting.getColor();
      });
    });
    super.initState();
  }

  void setColor(int color) {
    setState(() {
      settingColor = color;
      setting.setColor(color);
    });
  }

  void changeSize(String size) {
    setState(() {
      fontSize = double.tryParse(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Choose Themes for this app"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setColor(colors[0]),
                child: ColorSquare(colors[0]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[1]),
                child: ColorSquare(colors[1]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[2]),
                child: ColorSquare(colors[2]),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ColorSquare extends StatelessWidget {
  final int colorcode;

  ColorSquare(this.colorcode);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(colorcode),
      ),
    );
  }
}

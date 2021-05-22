import 'package:flutter/material.dart';
import 'package:task_7_dsc/splach_screen.dart';
void main ()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachSreen(),
    );
  }
}

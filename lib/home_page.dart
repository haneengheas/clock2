import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
   Future<void> _selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (date != null && date != selectedDate)
      setState(() {
        selectedDate = date;
      });
  }
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (time != null && time != selectedTime)
      setState(() {
        selectedTime = time;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 108, 156, 1),
      appBar: AppBar(
        title: Text(
          'Clock App',
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 254, 112, 88),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(68, 108, 156, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 250,
              child: Column(
                children: [
                  Text(
                    "${selectedTime.toString()}".split('   ')[0],
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: ()  async{
                await _selectDate(context);
                await _selectTime(context);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: Color.fromARGB(255, 254, 112, 88),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${selectedTime.toString()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.date_range,
                        color: Color.fromARGB(255, 254, 112, 88),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(seconds: 120),
                  backgroundColor: Color.fromRGBO(68, 98, 148, 1),
                    ));


              },
              child: Container(
                padding: EdgeInsets.only(left: 35, top: 10),
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 254, 112, 88),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'Choose Time and Date',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

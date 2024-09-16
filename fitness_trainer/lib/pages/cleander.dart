import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
  final int _daysToShow = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                          _currentMonth.year,
                          _currentMonth.month - 1,
                        );
                      });
                    },
                  ),
                  Text(
                    DateFormat('MMMM yyyy').format(_currentMonth),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                          _currentMonth.year,
                          _currentMonth.month + 1,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _daysToShow,
                itemBuilder: (context, index) {
                  DateTime startDate = DateTime(_currentMonth.year, _currentMonth.month, 1);
                  DateTime date = startDate.add(Duration(days: index));
                  bool isSelected = _selectedDate.day == date.day &&
                      _selectedDate.month == date.month &&
                      _selectedDate.year == date.year;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date;
                      });
                      print("Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}");
                    },
                    child: Container(
                      width: 40,
                      height: 10,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.purple : Colors.grey[200],
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('E').format(date).substring(0, 1),
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 20,
                              color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600

                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

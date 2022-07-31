import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zlga/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:zlga/acadaar_ctrl/config/ps_colors.dart';
import 'package:zlga/acadaar_ctrl/config/size_config.dart';
import 'package:zlga/acadaar_ctrl/config/style.dart';
import 'package:zlga/factory/provider/userProvider/user_provider.dart';
import 'package:zlga/factory/reprository/user_reprository.dart';
import 'package:zlga/screen/Controller/calendar.dart';
import 'package:zlga/screen/widget/eventWidget.dart';
import 'package:zlga/screen/widget/widgetCard.dart';
import 'package:zlga/screen/widget/widgetInfraction.dart';

class EventScreenIndex extends StatefulWidget {
  @override
  _EventScreenIndexState createState() => _EventScreenIndexState();
}

class _EventScreenIndexState extends State<EventScreenIndex> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _rangeStart;
  DateTime _rangeEnd;


  @override
  void initState() {
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }


  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      backgroundColor: PsColors.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/washing_machine_illustration.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: kToolbarHeight-10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                LineIcons.arrowLeft,
                                color: Colors.white,
                              ),
                            ),
                            TableCalendar<Event>(
                              firstDay: kFirstDay,
                              lastDay: kLastDay,
                              focusedDay: _focusedDay,
                              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                              calendarFormat: _calendarFormat,
                              rangeSelectionMode: _rangeSelectionMode,
                              eventLoader: _getEventsForDay,
                              headerStyle: HeaderStyle(
                                leftChevronIcon: Icon(LineIcons.arrowLeft,color: PsColors.white,),
                                rightChevronIcon: Icon(LineIcons.arrowRight,color: PsColors.white,),
                                titleTextStyle:  setStyleContent(context, Colors.white, 18, FontWeight.normal),
                              ),
                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle:  setStyleContent(context, Colors.white, 14, FontWeight.normal),
                              ),

                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              calendarStyle: CalendarStyle(
                                defaultTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                outsideTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                selectedTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                weekendTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                disabledTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                todayTextStyle: setStyleContent(context, Colors.white, 14, FontWeight.normal),
                                outsideDaysVisible: false,
                              ),
                              onDaySelected: _onDaySelected,
                              onRangeSelected: _onRangeSelected,
                              onFormatChanged: (format) {
                                if (_calendarFormat != format) {
                                  setState(() {
                                    _calendarFormat = format;
                                  });
                                }
                              },
                              onPageChanged: (focusedDay) {
                                _focusedDay = focusedDay;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 200.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EventWidget(
                              locationName: 'Zlgl Commissioning in Ondo State',
                              location: 'Akure',
                              date: '20-Aug-2021',
                            ),
                            EventWidget(
                              locationName: 'Zlgl Commissioning in Ondo State',
                              location: 'Akure',
                              date: '20-Aug-2021',
                            ),
                            EventWidget(
                              locationName: 'Zlgl Commissioning in Ondo State',
                              location: 'Akure',
                              date: '20-Aug-2021',
                            ),
                            EventWidget(
                              locationName: 'Zlgl Commissioning in Ondo State',
                              location: 'Akure',
                              date: '20-Aug-2021',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

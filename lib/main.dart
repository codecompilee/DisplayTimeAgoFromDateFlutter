import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getTimeSince({required DateTime date, bool isShort = false}) {
    String formattedString = "";
    DateTime now = DateTime.now();
    int secondsAgo = now.difference(date).inSeconds;

    int twoSeconds = 2;
    int minute = 60;
    int twoMinutes = minute * 2;
    int hour = 60 * minute;
    int twoHours = hour * 2;
    int day = 24 * hour;
    int twoDays = day * 2;
    int week = 7 * day;
    int twoWeeks = week * 2;
    int month = 4 * week;
    int twoMonths = month * 2;
    int year = 12 * month;
    int twoYears = year * 2;

    String secondString = isShort ? "s ago" : " second ago";
    String secondsString = isShort ? "s ago" : " seconds ago";
    String minuteString = isShort ? "m ago" : " minute ago";
    String minutesString = isShort ? "m ago" : " minutes ago";
    String hourString = isShort ? "h ago" : " hour ago";
    String hoursString = isShort ? "h ago" : " hours ago";
    String dayString = isShort ? "d ago" : " day ago";
    String daysString = isShort ? "d ago" : " days ago";
    String weekString = isShort ? "w ago" : " week ago";
    String weeksString = isShort ? "w ago" : " weeks ago";
    String monthString = isShort ? "mo ago" : " month ago";
    String monthsString = isShort ? "mo ago" : " months ago";
    String yearString = isShort ? "y ago" : " year ago";
    String yearsString = isShort ? "y ago" : " years ago";

    if (secondsAgo < twoSeconds) {
      formattedString = "$secondsAgo$secondString";
    } else if (secondsAgo < minute) {
      formattedString = "${secondsAgo.toStringAsFixed(0)}$secondsString";
    } else if (secondsAgo < twoMinutes) {
      formattedString = "${(secondsAgo / minute).toStringAsFixed(0)}$minuteString";
    } else if (secondsAgo < hour) {
      formattedString = "${(secondsAgo / minute).toStringAsFixed(0)}$minutesString";
    } else if (secondsAgo < twoHours) {
      formattedString = "${(secondsAgo / hour).toStringAsFixed(0)}$hourString";
    } else if (secondsAgo < day) {
      formattedString = "${(secondsAgo / hour).toStringAsFixed(0)}$hoursString";
    } else if (secondsAgo < twoDays) {
      formattedString = "${(secondsAgo / day).toStringAsFixed(0)}$dayString";
    } else if (secondsAgo < week) {
      formattedString = "${(secondsAgo / day).toStringAsFixed(0)}$daysString";
    } else if (secondsAgo < twoWeeks) {
      formattedString = "${(secondsAgo / week).toStringAsFixed(0)}$weekString";
    } else if (secondsAgo < month) {
      formattedString = "${(secondsAgo / week).toStringAsFixed(0)}$weeksString";
    } else if (secondsAgo < twoMonths) {
      formattedString = "${(secondsAgo / month).toStringAsFixed(0)}$monthString";
    } else if (secondsAgo < year) {
      formattedString = "${(secondsAgo / month).toStringAsFixed(0)}$monthsString";
    } else if (secondsAgo < twoYears) {
      formattedString = "${(secondsAgo / year).toStringAsFixed(0)}$yearString";
    } else {
      formattedString = "${(secondsAgo / year).toStringAsFixed(0)}$yearsString";
    }
    return formattedString;
  }

  List<String> longText = [];
  List<String> shortText = [];

  @override
  void initState() {
    super.initState();
    longText.addAll([
      getTimeSince(date: DateTime.now().subtract(const Duration(seconds: 3))),
      getTimeSince(date: DateTime.now().subtract(const Duration(minutes: 3))),
      getTimeSince(date: DateTime.now().subtract(const Duration(hours: 3))),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: 3))),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: (7 * 3)))),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: 90))),
      getTimeSince(
          date: DateTime(DateTime.now().year - 3, DateTime.now().month, DateTime.now().day)),
    ]);

    shortText.addAll([
      getTimeSince(date: DateTime.now().subtract(const Duration(seconds: 3)), isShort: true),
      getTimeSince(date: DateTime.now().subtract(const Duration(minutes: 3)), isShort: true),
      getTimeSince(date: DateTime.now().subtract(const Duration(hours: 3)), isShort: true),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: 3)), isShort: true),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: (7 * 3))), isShort: true),
      getTimeSince(date: DateTime.now().subtract(const Duration(days: 90)), isShort: true),
      getTimeSince(
          date: DateTime(DateTime.now().year - 3, DateTime.now().month, DateTime.now().day),
          isShort: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 260,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Text(
                            longText[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemCount: longText.length),
                ),
                VerticalDivider(
                  color: Colors.white54,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Text(
                            shortText[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemCount: shortText.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

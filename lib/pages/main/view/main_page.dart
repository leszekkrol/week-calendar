import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _MainView();
  }
}

class _MainView extends StatefulWidget {

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  final ScrollController _scrollController = ScrollController();
  final List<DateTime> _dates = [];
  final DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dates.addAll(_generateInitialDates());
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
    _scrollController.addListener(_onScroll);
  }

  List<DateTime> _generateInitialDates() {
    return List.generate(21, (i) => _currentDate.add(Duration(days: i - 5)));
  }

  void _scrollToCurrentDate() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent / 2);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      final isTop = _scrollController.position.pixels == _scrollController.position.minScrollExtent;
      setState(() {
        if (isTop) {
          _loadPastDates();
        } else {
          _loadMoreDates();
        }
      });
    }
  }

  void _loadMoreDates() {
    DateTime lastDate = _dates.last;
    _dates.addAll(List.generate(15, (i) => lastDate.add(Duration(days: i + 1))));
  }

  void _loadPastDates() {
    double offsetFromTop = _scrollController.position.maxScrollExtent - _scrollController.offset;
    DateTime firstDate = _dates.first;
    var newDates = List.generate(15, (i) => firstDate.subtract(Duration(days: i + 1))).reversed.toList();
    _dates.insertAll(0, newDates);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent - offsetFromTop);
    });
  }

  void _scrollToToday() {
    int todayIndex = _dates.indexWhere((date) => date.day == DateTime.now().day && date.month == DateTime.now().month && date.year == DateTime.now().year);

    if (todayIndex != -1) {
      final offset = todayIndex * 56.0;
      _scrollController.animateTo(
        offset,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _dates.length,
        itemBuilder: (BuildContext context, int index) {
          String formattedDate = DateFormat.yMMMMEEEEd().format(_dates[index]);
          var notification = NotificationItem(
            title: formattedDate,
            subtitle: "Description of event...",
            trailing: "9:00 AM",
          );

          bool isToday = _dates[index].day == DateTime.now().day &&
              _dates[index].month == DateTime.now().month &&
              _dates[index].year == DateTime.now().year;
          return Container(
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isToday ? [
                  Colors.blue.shade600,
                  Colors.blue.shade800,
                ]
                : [
                  Colors.grey.shade600,
                  Colors.grey.shade800,
                ],
              ),
            ),
            child: ListTile(
              title: Text(
                notification.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: Text(notification.subtitle),
              trailing: Text(notification.trailing),
            ),
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToToday,
        tooltip: 'Go to today',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.today),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String trailing;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });
}
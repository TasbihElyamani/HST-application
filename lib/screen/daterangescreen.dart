// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:intl/date_time_patterns.dart';

class Daterangescreen extends StatefulWidget {
  const Daterangescreen({super.key});

  @override
  State<Daterangescreen> createState() => _DaterangescreenState();
}

class _DaterangescreenState extends State<Daterangescreen> {
  DateTime? start;
  DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Date Rang Picker",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(start?.toIso8601String() ?? "-"),
            const Text("to"),
            Text(end?.toIso8601String() ?? "-"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(
                    const Duration(days: 356),
                  ),
                );

                if (result != null) {
                  setState(() {
                    start = result.start;
                    end = result.end;
                  });
                }
              },
              child: const Text("Date Range Picker"),
            ),
          ],
        ),
      ),
    );
  }
}

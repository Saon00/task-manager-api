import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardItem extends StatelessWidget {
  final int numberOfTask;
  final String taskType;

  const DashboardItem(
      {super.key, required this.numberOfTask, required this.taskType});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(numberOfTask.toString(),
                style: GoogleFonts.ubuntu(fontSize: 24)),
            const SizedBox(height: 8),
            FittedBox(child: Text(taskType, style: GoogleFonts.ubuntu())),
          ],
        ),
      ),
    );
  }
}

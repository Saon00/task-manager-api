import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCardItems extends StatelessWidget {
  final String subject, description, date, taskType;
  final VoidCallback onEditPress, onDeletePress;

  const TaskCardItems({
    super.key,
    required this.subject,
    required this.description,
    required this.date,
    required this.taskType,
    required this.onEditPress,
    required this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 6),
            Text(description, style: GoogleFonts.ubuntu()),
            const SizedBox(height: 6),
            Text(date, style: GoogleFonts.ubuntu()),
            const SizedBox(height: 6),
            Row(
              children: [
                Chip(
                  label: Text(taskType),
                  labelStyle: GoogleFonts.ubuntu(color: Colors.white),
                  backgroundColor: Colors.blue.shade300,
                ),
                const Spacer(),
                IconButton(
                    onPressed: onEditPress,
                    icon: const Icon(Icons.edit),
                    color: Colors.green),
                IconButton(
                    onPressed: onDeletePress,
                    icon: const Icon(Icons.delete),
                    color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}

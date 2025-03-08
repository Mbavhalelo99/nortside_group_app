import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NortSide Group Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NortSide Group Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Dummy data for the dashboard
  int revenue = 100000;
  int tasksCompleted = 35;
  int pendingTasks = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Business Overview Section
            SectionHeader(title: 'Business Overview'),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: const Text('Total Revenue'),
                subtitle: Text('\$${revenue.toString()}'),
                leading: const Icon(Icons.monetization_on),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: const Text('Tasks Completed'),
                subtitle: Text('$tasksCompleted tasks'),
                leading: const Icon(Icons.check_circle),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: const Text('Pending Tasks'),
                subtitle: Text('$pendingTasks tasks'),
                leading: const Icon(Icons.pending),
              ),
            ),

            // Task Management Section
            SectionHeader(title: 'Task Management'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for Task Management
                  },
                  icon: const Icon(Icons.add_task),
                  label: const Text('Add Task'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for Task Overview
                  },
                  icon: const Icon(Icons.view_list),
                  label: const Text('View Tasks'),
                ),
              ],
            ),

            // Financial Management Section
            SectionHeader(title: 'Financial Management'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for viewing financial details
                  },
                  icon: const Icon(Icons.account_balance_wallet),
                  label: const Text('View Financials'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for invoices or billing
                  },
                  icon: const Icon(Icons.receipt),
                  label: const Text('Invoices'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for section headers
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

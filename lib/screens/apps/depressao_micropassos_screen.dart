import 'package:flutter/material.dart';

class DepressaoMicroPassosScreen extends StatefulWidget {
  const DepressaoMicroPassosScreen({Key? key}) : super(key: key);

  @override
  State<DepressaoMicroPassosScreen> createState() => _DepressaoMicroPassosScreenState();
}

class _DepressaoMicroPassosScreenState extends State<DepressaoMicroPassosScreen> {
  int _completedTasks = 0;
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Beber 1 copo de água', 'done': false},
    {'title': 'Abrir a janela por 1 minuto', 'done': false},
    {'title': 'Lavar o rosto com água fresca', 'done': false},
  ];

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['done'] = !_tasks[index]['done'];
      _completedTasks = _tasks.where((t) => t['done'] == true).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F4),
      appBar: AppBar(
        title: const Text('MicroPassos (Depressão)'),
        backgroundColor: const Color(0xFF81B29A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  Icon(
                    _completedTasks == 0 ? Icons.energy_savings_leaf_outlined : Icons.nature,
                    size: 60,
                    color: const Color(0xFF81B29A),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Seu Jardim de Conquistas: $_completedTasks / ${_tasks.length}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: CheckboxListTile(
                      activeColor: const Color(0xFF81B29A),
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          decoration: task['done'] ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      value: task['done'],
                      onChanged: (_) => _toggleTask(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
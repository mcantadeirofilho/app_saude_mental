import 'package:flutter/material.dart';

class AutismoSinfoniaScreen extends StatefulWidget {
  const AutismoSinfoniaScreen({Key? key}) : super(key: key);

  @override
  State<AutismoSinfoniaScreen> createState() => _AutismoSinfoniaScreenState();
}

class _AutismoSinfoniaScreenState extends State<AutismoSinfoniaScreen> {
  final List<String> _routine = ['Acordar', 'Escovar os dentes', 'Café da manhã'];
  double _circleSize = 100.0;
  Color _circleColor = const Color(0xFF4A90E2);

  void _onSensoryTap() {
    setState(() {
      _circleSize = _circleSize == 100.0 ? 180.0 : 100.0;
      _circleColor = _circleColor == const Color(0xFF4A90E2) 
          ? const Color(0xFF50E3C2) 
          : const Color(0xFF4A90E2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text('Sinfonia dos Passos (TEA)'),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descompressão Sensorial',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
            ),
            const SizedBox(height: 8),
            const Text('Toque no círculo suavemente para regular estímulos:'),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: _onSensoryTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: _circleSize,
                  height: _circleSize,
                  decoration: BoxDecoration(
                    color: _circleColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _circleColor.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.touch_app, color: Colors.white, size: 32),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Rotina Visual Prévia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _routine.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF4A90E2),
                      child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(_routine[index], style: const TextStyle(fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.check_circle_outline, color: Colors.green),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
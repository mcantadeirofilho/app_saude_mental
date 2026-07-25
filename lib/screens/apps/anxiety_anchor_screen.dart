import 'dart:async';
import 'package:flutter/material.dart';

class AnxietyAnchorScreen extends StatefulWidget {
  const AnxietyAnchorScreen({Key? key}) : super(key: key);

  @override
  _AnxietyAnchorScreenState createState() => _AnxietyAnchorScreenState();
}

class _AnxietyAnchorScreenState extends State<AnxietyAnchorScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _instruction = 'Toque em Iniciar para acalmar a mente';
  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 100.0, end: 220.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _startBreathingCycle() {
    setState(() {
      _isRunning = true;
    });
    _runPhase();
  }

  void _runPhase() async {
    if (!_isRunning) return;

    // Inspire (4s)
    setState(() => _instruction = 'Inspire lentamente...');
    _controller.duration = const Duration(seconds: 4);
    _controller.forward();
    await Future.delayed(const Duration(seconds: 4));

    if (!_isRunning) return;

    // Segure (7s)
    setState(() => _instruction = 'Segure o ar...');
    await Future.delayed(const Duration(seconds: 7));

    if (!_isRunning) return;

    // Expire (8s)
    setState(() => _instruction = 'Expire devagar...');
    _controller.duration = const Duration(seconds: 8);
    _controller.reverse();
    await Future.delayed(const Duration(seconds: 8));

    if (_isRunning) _runPhase();
  }

  void _stopCycle() {
    setState(() {
      _isRunning = false;
      _instruction = 'Exercício pausado';
    });
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: const Text('Âncora - Controle de Ansiedade'),
        backgroundColor: const Color(0xFF2A9D8F),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _instruction,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF264653)),
            ),
            const SizedBox(height: 60),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF2A9D8F).withOpacity(0.4),
                    border: Border.all(color: const Color(0xFF2A9D8F), width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2A9D8F).withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A9D8F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: _isRunning ? _stopCycle : _startBreathingCycle,
              child: Text(_isRunning ? 'Pausar' : 'Iniciar Respiração', style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
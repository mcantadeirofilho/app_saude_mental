import 'package:flutter/material.dart';

class BipolarBussolaScreen extends StatefulWidget {
  const BipolarBussolaScreen({Key? key}) : super(key: key);

  @override
  State<BipolarBussolaScreen> createState() => _BipolarBussolaScreenState();
}

class _BipolarBussolaScreenState extends State<BipolarBussolaScreen> {
  double _energyLevel = 3.0; // Escala de 1 a 5

  String _getFeedback() {
    if (_energyLevel <= 2) return 'Fase de Baixa Energia: Recomendamos atividades suaves.';
    if (_energyLevel == 3) return 'Fase Estável: Excelente momento para rotinas normais.';
    return 'Fase de Alta Energia: Pratique exercícios de desaceleração inibitória.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text('Bússola do Humor'),
        backgroundColor: const Color(0xFFF4A261),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como está sua energia mental hoje?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Slider(
              value: _energyLevel,
              min: 1.0,
              max: 5.0,
              divisions: 4,
              activeColor: const Color(0xFFF4A261),
              label: _energyLevel.round().toString(),
              onChanged: (val) => setState(() => _energyLevel = val),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lento/Letárgico', style: TextStyle(color: Colors.grey)),
                Text('Hiperativo/Acel.', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF4A261).withOpacity(0.5)),
              ),
              child: Text(
                _getFeedback(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
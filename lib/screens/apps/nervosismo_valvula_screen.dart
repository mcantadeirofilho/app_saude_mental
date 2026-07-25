import 'package:flutter/material.dart';

class NervosismoValvulaScreen extends StatefulWidget {
  const NervosismoValvulaScreen({Key? key}) : super(key: key);

  @override
  State<NervosismoValvulaScreen> createState() => _NervosismoValvulaScreenState();
}

class _NervosismoValvulaScreenState extends State<NervosismoValvulaScreen> {
  int _popCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: const Text('Válvula de Escape'),
        backgroundColor: const Color(0xFF6C5CE7),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Estouros de Tensão: $_popCount',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF6C5CE7)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _popCount++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C5CE7).withOpacity(0.7),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C5CE7).withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: const Icon(Icons.touch_app, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
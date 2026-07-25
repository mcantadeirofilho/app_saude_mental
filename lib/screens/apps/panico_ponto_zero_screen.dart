import 'package:flutter/material.dart';

class PanicoPontoZeroScreen extends StatefulWidget {
  const PanicoPontoZeroScreen({Key? key}) : super(key: key);

  @override
  State<PanicoPontoZeroScreen> createState() => _PanicoPontoZeroScreenState();
}

class _PanicoPontoZeroScreenState extends State<PanicoPontoZeroScreen> {
  int _step = 5;

  void _nextStep() {
    setState(() {
      if (_step > 1) {
        _step--;
      } else {
        _step = 5; // Reinicia o protocolo
      }
    });
  }

  String _getInstruction() {
    switch (_step) {
      case 5:
        return 'Encontre 5 COISAS que você pode VER ao seu redor.';
      case 4:
        return 'Toque em 4 TEXTURAS ou objetos perto de você.';
      case 3:
        return 'Ouça e identifique 3 SONS no ambiente.';
      case 2:
        return 'Sinta ou lembre de 2 CHEIROS agrádaveis.';
      case 1:
        return 'Sinta 1 SABOR ou dê um gole de água.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF0ED),
      appBar: AppBar(
        title: const Text('Ponto Zero - Emergência'),
        backgroundColor: const Color(0xFFE76F51),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFFE76F51),
              child: Text(
                '$_step',
                style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _getInstruction(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF264653)),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE76F51),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _nextStep,
                child: Text(_step == 1 ? 'Concluir Protocolo' : 'Próximo Passo', style: const TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
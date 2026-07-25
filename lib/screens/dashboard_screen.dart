import 'package:flutter/material.dart';
import '../models/mental_health_app.dart';
import 'apps/anxiety_anchor_screen.dart';
import 'apps/autismo_sinfonia_screen.dart';
import 'apps/depressao_micropassos_screen.dart';
import 'apps/panico_ponto_zero_screen.dart';
import 'apps/bipolar_bussola_screen.dart';
import 'apps/nervosismo_valvula_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MentalHealthApp> appsList = [
      MentalHealthApp(
        id: '1',
        title: 'Âncora',
        tag: 'Ansiedade',
        description: 'Exercícios de respiração ritmo 4-7-8.',
        icon: Icons.anchor,
        primaryColor: const Color(0xFF2A9D8F),
        targetScreen: const AnxietyAnchorScreen(),
      ),
      MentalHealthApp(
        id: '2',
        title: 'Sinfonia dos Passos',
        tag: 'Autismo (TEA)',
        description: 'Organizador de rotinas visuais e estímulo sensorial.',
        icon: Icons.grid_view_rounded,
        primaryColor: const Color(0xFF4A90E2),
        targetScreen: const AutismoSinfoniaScreen(),
      ),
      MentalHealthApp(
        id: '3',
        title: 'MicroPassos',
        tag: 'Depressão',
        description: 'Jardim de conquistas diárias e ativação comportamental.',
        icon: Icons.eco,
        primaryColor: const Color(0xFF81B29A),
        targetScreen: const DepressaoMicroPassosScreen(),
      ),
      MentalHealthApp(
        id: '4',
        title: 'Ponto Zero',
        tag: 'Síndrome do Pânico',
        description: 'Protocolo de emergência Grounding 5-4-3-2-1.',
        icon: Icons.warning_amber_rounded,
        primaryColor: const Color(0xFFE76F51),
        targetScreen: const PanicoPontoZeroScreen(),
      ),
      MentalHealthApp(
        id: '5',
        title: 'Bússola do Humor',
        tag: 'Transtorno Bipolar',
        description: 'Rastreamento de energia diária e regulação circadiana.',
        icon: Icons.explore,
        primaryColor: const Color(0xFFF4A261),
        targetScreen: const BipolarBussolaScreen(),
      ),
      MentalHealthApp(
        id: '6',
        title: 'Válvula de Escape',
        tag: 'Nervosismo & Tensão',
        description: 'Descarga tátil e física de estresse acumulado.',
        icon: Icons.touch_app,
        primaryColor: const Color(0xFF6C5CE7),
        targetScreen: const NervosismoValvulaScreen(),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Saúde Mental & Bem-Estar', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appsList.length,
        itemBuilder: (context, index) {
          final app = appsList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: app.primaryColor.withOpacity(0.15),
                child: Icon(app.icon, color: app.primaryColor, size: 28),
              ),
              title: Row(
                children: [
                  Text(app.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: app.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      app.tag,
                      style: TextStyle(color: app.primaryColor, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(app.description, style: TextStyle(color: Colors.grey[600])),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => app.targetScreen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
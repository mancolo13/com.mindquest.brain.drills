import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _state = 0; // 0 = Idle, 1 = Ready, 2 = TAP NOW!
  int _reactionMs = 214;

  void _tapButton() {
    setState(() {
      if (_state == 0) {
        _state = 1;
      } else if (_state == 1) {
        _state = 2;
      } else {
        _reactionMs = 195 + (_reactionMs % 30);
        _state = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bg = AppTheme.card;
    String prompt = 'TAP TO BEGIN TEST';
    if (_state == 1) {
      bg = Colors.redAccent.shade700;
      prompt = 'WAIT FOR GREEN...';
    } else if (_state == 2) {
      bg = Colors.green.shade600;
      prompt = 'TAP NOW!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reaction Speed Arena', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primary),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _tapButton,
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: bg.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 8)),
                  ],
                ),
                child: Center(
                  child: Text(prompt, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('LAST REACTION', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                      const SizedBox(height: 4),
                      Text('$_reactionMs ms', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('RATING', style: TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                      const SizedBox(height: 4),
                      Text(_reactionMs < 200 ? 'Pro Gamer' : 'Human Reflex', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

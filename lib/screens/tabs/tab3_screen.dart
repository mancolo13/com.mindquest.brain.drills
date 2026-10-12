import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fastest Reflex Records', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('1. Flash_Apex', style: TextStyle(color: Colors.white)), trailing: Text('142 ms', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold))),
          ListTile(title: Text('2. CyberNinja', style: TextStyle(color: Colors.white)), trailing: Text('158 ms', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold))),
          ListTile(title: Text('3. SpeedDemon', style: TextStyle(color: Colors.white)), trailing: Text('164 ms', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}

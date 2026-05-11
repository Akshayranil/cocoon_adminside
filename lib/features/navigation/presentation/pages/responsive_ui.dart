import 'package:cocoon_admin/features/navigation/presentation/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        
        // 🔥 Mobile Screen
        if (constraints.maxWidth < 600) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Cocoon Admin"),
            ),
            drawer: const Drawer(
              child: NavigationRailWidget(), // reuse your widget
            ),
            body: const Center(child: Text("Mobile View")),
          );
        }

        // 🔥 Tablet / Web Screen
        else {
          return Scaffold(
            body: Row(
              children: [
                const NavigationRailWidget(), // your existing rail
                const VerticalDivider(width: 1),
                const Expanded(
                  child: Center(child: Text("Desktop View")),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
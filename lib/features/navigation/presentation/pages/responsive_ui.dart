import 'package:cocoon_admin/core/theme/colors.dart';
import 'package:cocoon_admin/features/navigation/presentation/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        // 📱 MOBILE
        if (constraints.maxWidth < 600) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primary,
              title: const Text("Cocoon Admin"),
            ),
            drawer: const Drawer(
              child: NavigationRailWidget(), // reuse menu
            ),
            body: child,
          );
        }

        // 💻 DESKTOP / TABLET
        return Scaffold(
          body: Row(
            children: [
              const NavigationRailWidget(),
              const VerticalDivider(width: 1),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}
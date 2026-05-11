import 'package:cocoon_admin/features/auth/presentation/ui/dialog_popup.dart';
import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:cocoon_admin/features/navigation/presentation/widgets/builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationRailWidget extends StatelessWidget {
  const  NavigationRailWidget({super.key});

  @override
Widget build(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  return BlocBuilder<NavrailCubit, int>(
    builder: (context, selectedIndex) {

      // 📱 MOBILE → use ListView instead of NavigationRail
      if (isMobile) {
        return ListView(
          children: [
            buildItem(context, Icons.hotel, "Hotels", 0),
            buildItem(context, Icons.lock, "Permission", 1),
            buildItem(context, Icons.room_preferences, "Aminities", 2),
            buildItem(context, Icons.settings, "Settings", 3),
            buildItem(context, Icons.help, "Help", 4),
            buildItem(context, Icons.logout, "Logout", 5),
          ],
        );
      }

      // 💻 DESKTOP → NavigationRail
      return NavigationRail(
        extended: true,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          if (index == 5) {
            showLogoutDialog(context);
            return;
          }
          context.read<NavrailCubit>().updateIndex(index);
        },
        backgroundColor: Colors.orange,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.hotel),
            label: Text('Hotels'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.lock_outlined),
            label: Text('Permission'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.room_preferences),
            label: Text('Aminities'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text('Settings'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.help_outline),
            label: Text('Help'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.logout_outlined),
            label: Text('Logout'),
          ),
        ],
      );
    },
  );
}
}

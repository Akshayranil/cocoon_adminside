import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationRailWidget extends StatelessWidget {
  const  NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavrailCubit, int>(
      builder: (context, selectedIndex) {
        return NavigationRail(
  extended: true,
  selectedIndex: selectedIndex,
  onDestinationSelected: (index) {
    context.read<NavrailCubit>().updateIndex(index);
  },
  selectedIconTheme: const IconThemeData(color: Colors.black),
  unselectedIconTheme: const IconThemeData(color: Colors.black),
  selectedLabelTextStyle: const TextStyle(color: Colors.white),
  unselectedLabelTextStyle: const TextStyle(color: Colors.black),
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
    // NavigationRailDestination(
    //   icon: Icon(Icons.bar_chart_outlined),
    //   label: Text('Reports'),
    // ),
    NavigationRailDestination(icon: Icon(Icons.room_preferences),
     label: Text('Aminities')),
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
      label: Text('LogOut'),
    ),
  ],
)
;
      },
    );
  }
}

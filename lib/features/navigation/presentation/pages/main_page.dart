import 'package:cocoon_admin/features/aminities/presentation/ui/screen_aminities.dart';
import 'package:cocoon_admin/features/help/presentation/ui/screen_help.dart';
import 'package:cocoon_admin/features/hotels/presentation/ui/screen_acceptedhotel.dart';
import 'package:cocoon_admin/features/logout/presentation/ui/screen_logout.dart';
import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:cocoon_admin/features/navigation/presentation/widgets/navigation_rail.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/screen_permission.dart';
import 'package:cocoon_admin/features/reports/presentation/ui/screen_reports.dart';
import 'package:cocoon_admin/features/settings/presentation/ui/screen_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationRailWidget(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: BlocBuilder<NavrailCubit, int>(
              builder: (context, selectedIndex) {
                switch (selectedIndex) {
                  case 0:
                    return const AcceptedHotelScreen();
                  case 1:
                    return const PermissionScreen();
                  
                  case 3:
                    return const SettingScreen();
                  case 2:
                    return const ScreenAminities();
                  case 4:
                    return const HelpScreen();
                  case 5:
                    return const LogoutScreen();
                  default:
                    return const AcceptedHotelScreen();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

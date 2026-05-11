// import 'package:cocoon_admin/features/aminities/presentation/ui/screen_aminities.dart';
// import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
// import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_state.dart';
// import 'package:cocoon_admin/features/auth/presentation/ui/login_screen.dart';
// import 'package:cocoon_admin/features/auth/presentation/ui/logout_screen.dart';
// import 'package:cocoon_admin/features/help/presentation/ui/screen_help.dart';
// import 'package:cocoon_admin/features/hotels/presentation/ui/screen_acceptedhotel.dart';
// import 'package:cocoon_admin/features/logout/presentation/ui/screen_logout.dart';
// import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
// import 'package:cocoon_admin/features/navigation/presentation/widgets/navigation_rail.dart';
// import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/screen_permission.dart';
// import 'package:cocoon_admin/features/reports/presentation/ui/screen_reports.dart';
// import 'package:cocoon_admin/features/settings/presentation/ui/screen_settings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   body: BlocListener<AuthBloc, AuthState>(
//     listener: (context, state) {
//       if (state is AuthLoggedOut) {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (_) => LoginScreen()),
//           (route) => false,
//         );
//       }
//     },

//     child: Row(
//       children: [
//         const NavigationRailWidget(),
//         const VerticalDivider(thickness: 1, width: 1),

//         Expanded(
//           child: BlocBuilder<NavrailCubit, int>(
//             builder: (context, selectedIndex) {
//               switch (selectedIndex) {
//                 case 0:
//                   return const AcceptedHotelScreen();
//                 case 1:
//                   return const PermissionScreen();
//                 case 2:
//                   return const ScreenAminities();
//                 case 3:
//                   return const SettingScreen();
//                 case 4:
//                   return const HelpScreen();
//                 default:
//                   return const AcceptedHotelScreen();
//               }
//             },
//           ),
//         ),
//       ],
//     ),
//   ),
// );
//   }
// }

import 'package:cocoon_admin/features/aminities/presentation/ui/screen_aminities.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:cocoon_admin/features/auth/presentation/bloc/bloc/auth_state.dart';
import 'package:cocoon_admin/features/auth/presentation/ui/login_screen.dart';
import 'package:cocoon_admin/features/help/presentation/ui/screen_help.dart';
import 'package:cocoon_admin/features/hotels/presentation/ui/screen_acceptedhotel.dart';
import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:cocoon_admin/features/navigation/presentation/pages/responsive_ui.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/screen_permission.dart';
import 'package:cocoon_admin/features/settings/presentation/ui/screen_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
            (route) => false,
          );
        }
      },

      // 🔥 USE RESPONSIVE LAYOUT HERE
      child: ResponsiveLayout(
        child: BlocBuilder<NavrailCubit, int>(
          builder: (context, selectedIndex) {
            switch (selectedIndex) {
              case 0:
                return const AcceptedHotelScreen();
              case 1:
                return const PermissionScreen();
              case 2:
                return const ScreenAminities();
              case 3:
                return const SettingScreen();
              case 4:
                return const HelpScreen();
              default:
                return const AcceptedHotelScreen();
            }
          },
        ),
      ),
    );
  }
}

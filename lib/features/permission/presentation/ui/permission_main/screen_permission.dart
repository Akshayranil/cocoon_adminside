import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/widgets/permission_table.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/widgets/widget_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocoon_admin/features/permission/presentation/bloc/permission_bloc.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchfield(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
              child: const Text(
                'Permissions',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 BlocBuilder for Hotels
            Expanded(
              child: BlocBuilder<PermissionBloc, PermissionState>(
                builder: (context, state) {
                  if (state is PermissionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PermissionLoaded) {
                    final hotels = state.hotels;

                    return PermissionTable(hotels: hotels);
                  } else if (state is PermissionError) {
                    return Center(child: Text("Error: ${state.error}"));
                  } else {
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

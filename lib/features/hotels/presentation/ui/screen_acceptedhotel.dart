import 'package:cocoon_admin/features/hotels/presentation/bloc/accepted_hotel_bloc.dart';
import 'package:cocoon_admin/features/hotels/presentation/widgets/accepted_hotel_table.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptedHotelScreen extends StatelessWidget {
  const AcceptedHotelScreen({super.key});

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
           
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
              child: const Text(
                'Accepted Hotels',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<AcceptedHotelBloc, AcceptedHotelState>(
                builder: (context, state) {
                  if (state is AcceptedHotelLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AcceptedHotelLoaded) {
                    final hotels = state.hotels;
                    return AcceptedHotelTable(hotels: hotels);
                  } else if (state is AcceptedHotelError) {
                    return Center(child: Text("Error: ${state.error}"));
                  } else {
                    return const Center(child: Text("No accepted hotels available"));
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

import 'package:cocoon_admin/features/permission/presentation/ui/screen_permissiondetailedscreen.dart';
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
            // 🔎 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // 📌 Title
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

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 40,
                          horizontalMargin: 20,
                          dataRowHeight: 60,
                          headingRowHeight: 55,
                          dividerThickness: 0.7,
                          headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
                          columns: const [
                            DataColumn(label: Text("Hotel Name", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Description", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: hotels.map((hotel) {
                            return DataRow(
                              cells: [
                                // Hotel Name clickable
                                DataCell(
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PermissionDetailScreen(),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      width: 150,
                                      child: Text(
                                        hotel.name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),

                                // Description
                                DataCell(SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Service booked",
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),

                                // Amount
                                DataCell(SizedBox(
                                  width: 100,
                                  child: Text(
                                    "₹ 49,000",
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),

                                // Type
                                DataCell(SizedBox(
                                  width: 100,
                                  child: Text(
                                    hotel.type,
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),

                                // Date
                                DataCell(SizedBox(
                                  width: 120,
                                  child: Text(
                                    hotel.booking,
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),

                                // Action
                                DataCell(Row(
                                  children: const [
                                    Icon(Icons.edit, size: 20, color: Colors.blueGrey),
                                    SizedBox(width: 12),
                                    Icon(Icons.delete, size: 20, color: Colors.redAccent),
                                  ],
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
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

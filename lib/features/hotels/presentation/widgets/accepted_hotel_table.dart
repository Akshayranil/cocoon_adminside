import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';
import 'package:cocoon_admin/features/hotels/presentation/widgets/accepted_hotel_detailscreen.dart';
import 'package:cocoon_admin/features/permission/domain/entity/permission_entity.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_main/widgets/widget_date.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/screen_permissiondetailedscreen.dart';
import 'package:flutter/material.dart';

class AcceptedHotelTable extends StatelessWidget {
  final List<AcceptedHotelEntity> hotels;
  const AcceptedHotelTable({super.key,required this.hotels});

  @override
  Widget build(BuildContext context) {
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 60,
          horizontalMargin: 20,
          headingRowHeight: 55,
          dividerThickness: 0.7,
          headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
          columns: const [
            DataColumn(
              label: Text(
                "Hotel Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Location",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Action",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
                          builder: (_) => AcceptedHotelDetailscreen(hotel: hotel),
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
                DataCell(
                  SizedBox(
                    width: 200,
                    child: Text(
                      hotel.propertyinformation,

                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // Pending
                // Status with color
              DataCell(
  SizedBox(
    width: 120,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: (hotel.status.toLowerCase() == 'accepted')
            ? Colors.green.withOpacity(0.1):Colors.grey,
           
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: (hotel.status.toLowerCase() == 'accepted')
              ? Colors.green
              
                      : Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          hotel.status,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: (hotel.status.toLowerCase() == 'accepted')
                ? Colors.green
                : Colors.black,
          ),
        ),
      ),
    ),
  ),
),


                // Type
                DataCell(
                  SizedBox(
                    width: 100,
                    child: Text(
                      hotel.type,
                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // Date
                DataCell(
                  SizedBox(
                    width: 120,
                    child: Text(
                      formatDate(hotel.booking),
                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // Action
                DataCell(
                  Row(
                    children: const [
                      Icon(Icons.edit, size: 20, color: Colors.blueGrey),
                      SizedBox(width: 12),
                      Icon(Icons.delete, size: 20, color: Colors.redAccent),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

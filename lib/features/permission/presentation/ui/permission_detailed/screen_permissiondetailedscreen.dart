import 'dart:developer';

import 'package:cocoon_admin/core/theme/colors.dart';
import 'package:cocoon_admin/features/permission/presentation/bloc/permission_bloc.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_sidebarcards.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_sidecards.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_textfields.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/image_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/permission_entity.dart';

class PermissionDetailScreen extends StatelessWidget {
  final HotelEntity hotel;

  const PermissionDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text("Permissions Details"),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<PermissionBloc>().add(
                UpdateHotelStatus(hotelId: hotel.id, status: "rejected"),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(foregroundColor: AppColor.secondary,backgroundColor: AppColor.warning),
            child: const Text("Reject"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              context.read<PermissionBloc>().add(
                UpdateHotelStatus(hotelId: hotel.id, status: "accepted"),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.success,foregroundColor: AppColor.secondary),
            child: const Text("Approve"),
          ),
          const SizedBox(width: 20),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDE
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // General Information
                    
                    buildCard(
                      title: "General Information",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextField("Hotel Name", hotel.name),
                          const SizedBox(height: 12),
                          const Text("Document"),
                          const SizedBox(height: 8),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: hotel.document != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // IMAGE DOCUMENT PREVIEW (clickable)
                                        if (hotel.document.endsWith('.jpg') ||
                                            hotel.document.endsWith('.jpeg') ||
                                            hotel.document.endsWith('.png'))
                                          GestureDetector(
                                            // behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              log('Image is tapped');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      ImagePreviewScreen(
                                                        imageUrl:
                                                            hotel.document,
                                                      ),
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                hotel.document!,
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        // PDF PREVIEW (icon + filename)
                                        else if (hotel.document.endsWith(
                                          '.pdf',
                                        ))
                                          Column(
                                            children: [
                                              const Icon(
                                                Icons.picture_as_pdf,
                                                color: Colors.red,
                                                size: 40,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                hotel.document.split('/').last,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          )
                                        // Fallback text (if format not known)
                                        else
                                          Text(
                                            hotel.document,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),

                                        const SizedBox(height: 8),
                                        // TextButton.icon(
                                        //   onPressed: () async {
                                        //     final Uri url = Uri.parse(
                                        //       hotel.document,
                                        //     );
                                        //     // You can use url_launcher to open:
                                        //     // await launchUrl(url);
                                        //   },
                                        //   icon: const Icon(
                                        //     Icons.open_in_new,
                                        //     size: 18,
                                        //   ),
                                        //   label: const Text("View Document"),
                                        // ),
                                      ],
                                    )
                                  : const Text("No document uploaded"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Media (from Firebase list)
                    if (hotel.hotelimages != null &&
                        hotel.hotelimages.isNotEmpty)
                      buildCard(
                        title: "Media",
                        child: SizedBox(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: hotel.hotelimages.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (_, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  hotel.hotelimages[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Finance Details
                    buildCard(
                      title: "Finance Details",
                      child: Column(
                        children: [
                          buildTextField("GST Number", hotel.gst ?? "N/A"),
                          buildTextField("PAN Number", hotel.pan ?? "N/A"),
                          buildTextField(
                            "Property Type",
                            hotel.isOwnedorLeased ?? "N/A",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Contact Details
                    buildCard(
                      title: "Contact Details",
                      child: Column(
                        children: [
                          buildTextField(
                            "Phone number",
                            hotel.phonenumber ?? "N/A",
                          ),
                          buildTextField("Email", hotel.email ?? "N/A"),
                          buildTextField("Booking Since", hotel.booking),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // RIGHT SIDE
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buildSidebarCard("Category", hotel.type),
                  const SizedBox(height: 20),
                  buildSidebarCard(
                    "Location",
                    hotel.propertyinformation ?? "N/A",
                  ),
                  const SizedBox(height: 20),
                  buildSidebarCard("Status", hotel.status ?? "N/A"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/core/theme/colors.dart';
import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_sidebarcards.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_sidecards.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/build_textfields.dart';
import 'package:cocoon_admin/features/permission/presentation/ui/permission_detailed/widgets/image_preview_screen.dart';
import 'package:cocoon_admin/shared/review_entity.dart';
import 'package:flutter/material.dart';

class AcceptedHotelDetailscreen extends StatelessWidget {
  final AcceptedHotelEntity hotel;

  const AcceptedHotelDetailscreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text("Accepted Hotel Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- LEFT SIDE ----------
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
                                        if (hotel.document.endsWith('.jpg') ||
                                            hotel.document.endsWith('.jpeg') ||
                                            hotel.document.endsWith('.png'))
                                          GestureDetector(
                                            onTap: () {
                                              log('Image tapped');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      ImagePreviewScreen(
                                                    imageUrl: hotel.document!,
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
                                        else if (hotel.document.endsWith('.pdf'))
                                          Column(
                                            children: [
                                              const Icon(
                                                Icons.picture_as_pdf,
                                                color: Colors.red,
                                                size: 40,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                hotel.document!
                                                    .split('/')
                                                    .last,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          )
                                        else
                                          Text(
                                            hotel.document!,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                      ],
                                    )
                                  : const Text("No document uploaded"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Media Section
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

                    const SizedBox(height: 20),

                    // User Reviews
                    buildCard(
                      title: "User Reviews",
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('hotel_reviews')
                            .where('hotelId', isEqualTo: hotel.id)
                            .orderBy('createdAt', descending: true)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Text("No reviews available");
                          }

                          final reviews = snapshot.data!.docs
                              .map((doc) => ReviewEntity.fromMap(
                                  doc.data() as Map<String, dynamic>))
                              .toList();

                          return Column(
                            children: reviews.map((review) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review.userName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index < review.rating.round()
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(review.comment),
                                    const SizedBox(height: 4),
                                    Text(
                                      review.createdAt
                                          .toLocal()
                                          .toString()
                                          .split('.')
                                          .first,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            // ---------- RIGHT SIDE ----------
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buildSidebarCard("Category", hotel.type ?? "N/A"),
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

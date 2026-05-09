import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';


class AcceptedHotelModel {
  final String id;
  final String type;
  final String name;
  final String booking;
  final String phonenumber;
  final String email;
  final List<String> facilities;
  final String pan;
  final String gst;
  final String propertyinformation;
  final String isOwnedorLeased;
  final String haveRegistration;
  final String document;
  final String status;
  final DateTime? createdAt;
  final List<String> hotelimages;
  AcceptedHotelModel({
    required this.id,
    required this.type,
    required this.name,
    required this.booking,
    required this.phonenumber,
    required this.email,
    required this.facilities,
    required this.pan,
    required this.gst,
    required this.propertyinformation,
    required this.isOwnedorLeased,
    required this.haveRegistration,
    required this.document,
    required this.status,
    this.createdAt,
    required this.hotelimages,
  });

  factory AcceptedHotelModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AcceptedHotelModel(
      id: doc.id,
      type: data['type'] ?? '',
      name: data['name'] ?? '',
      booking: data['booking'] ?? '',
      phonenumber: data['phonenumber'] ?? '',
      email: data['email'] ?? '',
      facilities: List<String>.from(data['facilities'] ?? []),
      pan: data['pan'],
      gst: data['gst'],
      propertyinformation: data['propertyinformation'],
      isOwnedorLeased: data['isOwnedorLeased'],
      haveRegistration: data['haveRegistration'],
      document: data['document'],
      status: data['status'],
      hotelimages: List<String>.from(data['hotelimages']),
    );
  }

  AcceptedHotelEntity toEntity() {
    return AcceptedHotelEntity(
      id: id,
      type: type,
      name: name,
      booking: booking,
      phonenumber: phonenumber,
      email: email,
      facilities: facilities,
      pan: pan,
      gst: gst,
      propertyinformation: propertyinformation,
      isOwnedorLeased: isOwnedorLeased,
      haveRegistration: haveRegistration,
      document: document,
      status: status,
      hotelimages: hotelimages,
    );
  }
}

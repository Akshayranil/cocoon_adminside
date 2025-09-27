// domain/entities/hotel_entity.dart
class HotelEntity {
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

  HotelEntity({
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
}

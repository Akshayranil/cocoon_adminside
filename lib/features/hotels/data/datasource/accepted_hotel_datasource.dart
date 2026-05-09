import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/hotels/data/model/accepted_hotel_model.dart';


class AcceptedHotelDatasource {
  final FirebaseFirestore firestore;

  AcceptedHotelDatasource(this.firestore);

  Future<List<AcceptedHotelModel>> fetchHotels() async {
    final snapshot = await firestore.collection('hotelregistration').get();
    return snapshot.docs.map((doc) => AcceptedHotelModel.fromFirestore(doc)).toList();
  }

  Future<void> updateHotelStatus(String hotelId, String status) async {
    await firestore.collection('hotelregistration').doc(hotelId).update({
      'status': status,
    });
  }

  // ✅ Fetch only accepted hotels
  Future<List<AcceptedHotelModel>> fetchAcceptedHotels() async {
    final snapshot = await firestore
        .collection('hotelregistration')
        .where('status', isEqualTo: 'accepted')
        .get();

    return snapshot.docs.map((doc) => AcceptedHotelModel.fromFirestore(doc)).toList();
  }
}

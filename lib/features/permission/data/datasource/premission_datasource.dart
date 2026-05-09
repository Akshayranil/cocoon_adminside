import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/permission/data/model/permission_model.dart';

class HotelRemoteDataSource {
  final FirebaseFirestore firestore;

  HotelRemoteDataSource(this.firestore);

  Future<List<HotelModel>> fetchHotels() async {
    final snapshot = await firestore.collection('hotelregistration').get();
    return snapshot.docs.map((doc) => HotelModel.fromFirestore(doc)).toList();
  }

  Future<void> updateHotelStatus(String hotelId, String status) async {
    await firestore.collection('hotelregistration').doc(hotelId).update({
      'status': status,
    });
  }
}

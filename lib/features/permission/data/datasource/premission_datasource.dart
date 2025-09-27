import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/permission/data/model/permission_model.dart';

class HotelRemoteDataSource {
  final FirebaseFirestore firestore;

  HotelRemoteDataSource(this.firestore);

  Future<List<HotelModel>> fetchHotels() async {
    final snapshot = await firestore.collection('hotelregistration').get();
    return snapshot.docs.map((doc) => HotelModel.fromFirestore(doc)).toList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/aminities/data/model/aminities_model.dart';

class AminitiesDataSource {
  final FirebaseFirestore firestore;

  AminitiesDataSource(this.firestore);

  Future<List<AminitiesModel>> getAminities() async {
    final snapshot = await firestore.collection('aminities').get();
    return snapshot.docs
        .map((doc) => AminitiesModel.fromFirestore(doc))
        .toList();
  }

  Future<void> addAminities(String name) async {
    await firestore.collection('aminities').add({'name': name});
  }

  Future<void> deleteAminities(String id) async {
    await firestore.collection('aminities').doc(id).delete();
  }
}

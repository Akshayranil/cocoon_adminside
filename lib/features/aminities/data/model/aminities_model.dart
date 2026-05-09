import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_admin/features/aminities/domain/entity/aminities_entity.dart';

class AminitiesModel {
  final String id;
  final String name;
  final String? icon;

  AminitiesModel({required this.id, required this.name, this.icon});

  factory AminitiesModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AminitiesModel(id: doc.id, name: data['name'], icon: data['icon']);
  }

  AminitiesEntity toAminityEntity() {
    return AminitiesEntity(id: id, name: name);
  }
}

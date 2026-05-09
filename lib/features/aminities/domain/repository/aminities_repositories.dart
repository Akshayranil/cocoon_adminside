import 'package:cocoon_admin/features/aminities/domain/entity/aminities_entity.dart';

abstract class AminitiesRepositories {
  Future<List<AminitiesEntity>> getAllAminities();
  Future<void> addSpecificAminities(String name);
  Future<void> deleteSpecificAminities(String id);
}

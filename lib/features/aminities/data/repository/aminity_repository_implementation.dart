import 'package:cocoon_admin/features/aminities/data/datasource/aminities_data_source.dart';
import 'package:cocoon_admin/features/aminities/domain/entity/aminities_entity.dart';
import 'package:cocoon_admin/features/aminities/domain/repository/aminities_repositories.dart';

class AminityRepositoryImplementation implements AminitiesRepositories {
  final AminitiesDataSource remoteDataSource;

  AminityRepositoryImplementation(this.remoteDataSource);

  @override
  Future<List<AminitiesEntity>> getAllAminities() async {
    final models = await remoteDataSource.getAminities();
    return models.map((model) => model.toAminityEntity()).toList();
  }

  @override
  Future<void> addSpecificAminities(String name) async {
    await remoteDataSource.addAminities(name);
  }

  @override
  Future<void> deleteSpecificAminities(String id) async {
    await remoteDataSource.deleteAminities(id);
  }
}

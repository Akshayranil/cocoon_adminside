import 'package:cocoon_admin/features/permission/data/datasource/premission_datasource.dart';
import 'package:cocoon_admin/features/permission/domain/entity/permission_entity.dart';
import 'package:cocoon_admin/features/permission/domain/repository/permission_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource remoteDataSource;

  HotelRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<HotelEntity>> getHotels() async {
    final models = await remoteDataSource.fetchHotels();
    return models.map((model) => model.toEntity()).toList();
  }
}

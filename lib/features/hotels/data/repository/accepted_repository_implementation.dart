

import 'package:cocoon_admin/features/hotels/data/datasource/accepted_hotel_datasource.dart';
import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';
import 'package:cocoon_admin/features/hotels/domain/repository/accepted_hotel_repository.dart';

class AcceptedRepositoryImplementation implements AcceptedHotelRepository {
  final AcceptedHotelDatasource remoteDataSource;

  AcceptedRepositoryImplementation(this.remoteDataSource);

  @override
  Future<List<AcceptedHotelEntity>> getHotels() async {
    final models = await remoteDataSource.fetchHotels();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateHotelStatus(String hotelId, String status) {
    return remoteDataSource.updateHotelStatus(hotelId, status);
  }

  @override
  Future<List<AcceptedHotelEntity>> getAcceptedHotels() async {
    final models = await remoteDataSource.fetchAcceptedHotels();
    return models.map((model) => model.toEntity()).toList();
  }
}

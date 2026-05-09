


import 'package:cocoon_admin/features/permission/domain/entity/permission_entity.dart';
import 'package:cocoon_admin/features/permission/domain/repository/permission_repository.dart';

class GetHotelsUseCase {
  final HotelRepository repository;

  GetHotelsUseCase(this.repository);

  Future<List<HotelEntity>> call() async {
    final hotels = await repository.getHotels();
    return hotels;
  }
}

class UpdateHotelStatusUseCase {
  final HotelRepository repository;

  UpdateHotelStatusUseCase(this.repository);

  Future<void> call(String hotelId, String status) {
    return repository.updateHotelStatus(hotelId, status);
  }
}

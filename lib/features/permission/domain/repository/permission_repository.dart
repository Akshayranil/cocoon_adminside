// domain/repositories/hotel_repository.dart

import 'package:cocoon_admin/features/permission/domain/entity/permission_entity.dart';

abstract class HotelRepository {
  Future<List<HotelEntity>> getHotels();

  Future<void> updateHotelStatus(String hotelId, String status);
}

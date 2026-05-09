import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';


abstract class AcceptedHotelRepository {
  Future<List<AcceptedHotelEntity>> getHotels();
  Future<void> updateHotelStatus(String hotelId, String status);
  Future<List<AcceptedHotelEntity>> getAcceptedHotels(); // ✅ new
}

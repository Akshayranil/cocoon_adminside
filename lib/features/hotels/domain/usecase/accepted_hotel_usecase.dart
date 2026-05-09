

import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';
import 'package:cocoon_admin/features/hotels/domain/repository/accepted_hotel_repository.dart';

class  AcceptedHotelUsecase{
  final AcceptedHotelRepository repository;

  AcceptedHotelUsecase(this.repository);

  Future<List<AcceptedHotelEntity>> call() async {
    return await repository.getAcceptedHotels();
  }
}

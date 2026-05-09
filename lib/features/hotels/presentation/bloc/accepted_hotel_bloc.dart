import 'package:bloc/bloc.dart';
import 'package:cocoon_admin/features/hotels/domain/entity/accepted_hotel_entity.dart';

import 'package:cocoon_admin/features/hotels/domain/usecase/accepted_hotel_usecase.dart';

import 'package:meta/meta.dart';

part 'accepted_hotel_event.dart';
part 'accepted_hotel_state.dart';

class AcceptedHotelBloc extends Bloc<AcceptedHotelEvent, AcceptedHotelState> {
  final AcceptedHotelUsecase getAcceptedHotelsUseCase;

  AcceptedHotelBloc(this.getAcceptedHotelsUseCase)
      : super(AcceptedHotelInitial()) {
    on<LoadAcceptedHotels>((event, emit) async {
      emit(AcceptedHotelLoading());
      try {
        final hotels = await getAcceptedHotelsUseCase();
        emit(AcceptedHotelLoaded(hotels));
      } catch (e) {
        emit(AcceptedHotelError(e.toString()));
      }
    });
  }
}

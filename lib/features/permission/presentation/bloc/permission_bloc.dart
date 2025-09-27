import 'package:bloc/bloc.dart';
import 'package:cocoon_admin/features/permission/domain/entity/permission_entity.dart';
import 'package:cocoon_admin/features/permission/domain/usecase/permission_usecases.dart';
import 'package:meta/meta.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final GetHotelsUseCase getHotelsUseCase;
  PermissionBloc(this.getHotelsUseCase) : super(PermissionInitial()) {
    on<LoadHotels>((event, emit) async {
      emit(PermissionLoading());
      try {
        final hotels = await getHotelsUseCase();
        emit(PermissionLoaded(hotels));
      } catch (e) {
        emit(PermissionError(e.toString()));
      }
    });
  }
}
